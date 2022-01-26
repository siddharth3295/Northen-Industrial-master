codeunit 50005 "Vendor Item Import Mgmt"
{
    procedure ReadExcelSheet()
    var
        FileMgt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, IStream);
        if FromFile <> '' then begin
            FileName := FileMgt.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
        ImportExcelData()
    end;

    local procedure ImportExcelData()
    var
        VendorItemBuffer: Record "Vendor Item Buffer";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;
        Item: Record Item;
        ItemVendorCatelog: Record "Item Vendor";
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        LineNo := 0;
        VendorItemBuffer.Reset();
        if VendorItemBuffer.FindLast() then
            LineNo := VendorItemBuffer."Line No.";
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;

        for RowNo := 2 to MaxRowNo do begin
            LineNo := LineNo + 10000;
            VendorItemBuffer.Init();
            VendorItemBuffer."Line No." := LineNo;
            Evaluate(VendorItemBuffer."Vendor Code", GetValueAtCell(RowNo, 1));
            Evaluate(VendorItemBuffer."Part Code", GetValueAtCell(RowNo, 2));
            Evaluate(VendorItemBuffer.Condition, GetValueAtCell(RowNo, 3));
            Evaluate(VendorItemBuffer."Cost Price", GetValueAtCell(RowNo, 4));
            Evaluate(VendorItemBuffer."Qty Available", GetValueAtCell(RowNo, 5));
            Evaluate(VendorItemBuffer."Vendor Item Name", GetValueAtCell(RowNo, 6));
            Evaluate(VendorItemBuffer.Country, GetValueAtCell(RowNo, 7));
            Evaluate(VendorItemBuffer."Lead Time Calculation", GetValueAtCell(RowNo, 8));
            VendorItemBuffer."Currency Code" := GetValueAtCell(RowNo, 9);
            Item.reset();
            Item.setrange("Part Code", VendorItemBuffer."Part Code");
            Item.setrange(Condition, VendorItemBuffer.Condition);
            if Item.FindFirst() then
                VendorItemBuffer.validate("Item No.", Item."No.")
            else
                VendorItemBuffer."Error Context" := 'Item not found!';
            VendorItemBuffer."Sheet Name" := SheetName;
            VendorItemBuffer."File Name" := FileName;
            VendorItemBuffer."Imported Date" := Today;
            VendorItemBuffer."Imported Time" := Time;
            VendorItemBuffer.Insert();
        end;
        VendorItemBuffer.Reset();
        if VendorItemBuffer.FindSet() then begin
            Repeat
                if VendorItemBuffer."Error Context" = '' then
                    if ItemVendorCatelog.GET(VendorItemBuffer."Vendor Code", VendorItemBuffer."Item No.", '') then begin
                        //
                        ItemVendorCatelog."Vendor Item No." := VendorItemBuffer."Part Code";
                        ItemVendorCatelog."Vendor Item Name" := VendorItemBuffer."Vendor Item Name";
                        ItemVendorCatelog."Lead Time Calculation" := VendorItemBuffer."Lead Time Calculation";
                        ItemVendorCatelog."Item No." := VendorItemBuffer."Item No.";
                        ItemVendorCatelog."Country/Region Code" := VendorItemBuffer.Country;
                        ItemVendorCatelog."Quantity Available" := VendorItemBuffer."Qty Available";
                        ItemVendorCatelog."Vendor No." := VendorItemBuffer."Vendor Code";
                        ItemVendorCatelog."Unit Cost" := VendorItemBuffer."Cost Price";
                        ItemVendorCatelog."Currency Code" := VendorItemBuffer."Currency Code";
                        ItemVendorCatelog.Modify();
                    end Else begin
                        //
                        ItemVendorCatelog.Init();
                        ItemVendorCatelog."Vendor Item No." := VendorItemBuffer."Part Code";
                        ItemVendorCatelog."Vendor Item Name" := VendorItemBuffer."Vendor Item Name";
                        ItemVendorCatelog."Lead Time Calculation" := VendorItemBuffer."Lead Time Calculation";
                        ItemVendorCatelog."Item No." := VendorItemBuffer."Item No.";
                        ItemVendorCatelog."Country/Region Code" := VendorItemBuffer.Country;
                        ItemVendorCatelog."Quantity Available" := VendorItemBuffer."Qty Available";
                        ItemVendorCatelog."Vendor No." := VendorItemBuffer."Vendor Code";
                        ItemVendorCatelog."Unit Cost" := VendorItemBuffer."Cost Price";
                        ItemVendorCatelog."Currency Code" := VendorItemBuffer."Currency Code";
                        ItemVendorCatelog.Insert();
                        //
                    end;

            Until VendorItemBuffer.Next() = 0;
        end;
        //Message(ExcelImportSucess);

    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin

        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    var
        BatchName: Code[10];
        FileName: Text[100];
        SheetName: Text[100];

        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadExcelMsg: Label 'Please Choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        BatchISBlankMsg: Label 'Batch name is blank';
        ExcelImportSucess: Label 'Excel is successfully imported.';
}
