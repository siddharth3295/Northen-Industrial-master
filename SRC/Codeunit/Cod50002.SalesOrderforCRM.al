codeunit 50002 "Sales Order for CMR"
{


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Sales Order to Sales Order", 'OnCreateSalesOrderLinesOnBeforeSalesLineInsert', '', true, true)]
    local procedure OnCreateSalesOrderLinesOnBeforeSalesLineInsert_2(var SalesLine: Record "Sales Line";
    CRMSalesorderdetail: Record "CRM Salesorderdetail")
    var
        SalesHeader: Record "Sales Header";
        SalesSetup: Record "Sales & Receivables Setup";
        ItemLedgerEntry: Record "Item Ledger Entry";
        Item: Record Item;

    begin
        SalesSetup.get();
        SalesSetup.TestField("NIC CRM Order Location");
        SalesLine.Validate("Location Code", SalesSetup."NIC CRM Order Location");
        if SalesLine."No." <> '' then begin
            SalesLine."NIC_Serial No." := CRMSalesorderdetail."Serial No";
            SalesLine.Component := true;
            if SalesHeader.Get(SalesHeader."Document Type"::Order, SalesLine."Document No.") then
                if SalesLine."No." = SalesHeader."NIC_FG Item No." then
                    SalesLine."Need to Convert" := true;
            Item.Get(SalesLine."No.");
            if Item."Item Tracking Code" <> '' then
                SalesLine.TestField("NIC_Serial No.");

            if Item.Type = Item.Type::Inventory then begin
                ItemLedgerEntry.Reset();
                ItemLedgerEntry.SetRange("Location Code", SalesLine."Location Code");
                ItemLedgerEntry.SetRange(ItemLedgerEntry."Item No.", SalesLine."No.");
                ItemLedgerEntry.SetRange(ItemLedgerEntry.Open, true);
                ItemLedgerEntry.SetRange(ItemLedgerEntry.Positive, true);
                ItemLedgerEntry.SetFilter(ItemLedgerEntry."Remaining Quantity", '<>%1', 0);
                if Item."Item Tracking Code" <> '' then
                    ItemLedgerEntry.SetRange("Serial No.", SalesLine."NIC_Serial No.");
                if ItemLedgerEntry.FindFirst() then begin
                    ItemLedgerEntry.CalcFields("Reserved Quantity");
                    if SalesLine.Quantity > (ItemLedgerEntry."Remaining Quantity" - ABS(ItemLedgerEntry."Reserved Quantity")) then
                        if Item."Item Tracking Code" = '' then
                            Error('Item No %1, is Not Available at Location %2.', SalesLine."No.", SalesLine."Location Code")
                        Else
                            Error('Item No %1, is Not Available at Location %2 With Serial No. %3', SalesLine."No.", SalesLine."Location Code", SalesLine."NIC_Serial No.")
                end else
                    if Item."Item Tracking Code" = '' then
                        Error('Item No %1, is Not Available at Location %2.', SalesLine."No.", SalesLine."Location Code")
                    Else
                        Error('Item No %1, is Not Available at Location %2 With Serial No. %3', SalesLine."No.", SalesLine."Location Code", SalesLine."NIC_Serial No.")
            end;
        end;
        // SalesLine.Mul_Multiplier := CRMSalesorderdetail.mul_multiplier;
        // SalesLine."Mul_Quote Description" := Copystr(GetBLOBDescription2(CRMSalesorderdetail), 1, 250);
        // SalesLine.Mul_Tag := Format(CRMSalesorderdetail.Mul_Tag);
        // SalesLine.Mul_Weight := CRMSalesorderdetail.mul_Weight;
        // SalesLine."Freight Amount" := CRMSalesorderdetail.mul_FreightAmountOverride;
    end;

    // local procedure GetBLOBDescription2(CRMSalesLine: Record "CRM Salesorderdetail") WorkDescription: Text
    // var
    //     MyInStream: InStream;
    //     i: Integer;
    //     CR: Text[1];
    //     TypeHelperCodeunit: Codeunit "Type Helper";
    // begin
    //     Clear(WorkDescription);
    //     CRMSalesLine.Calcfields(mul_QuoteDesc);
    //     If CRMSalesLine.mul_QuoteDesc.HasValue() then begin
    //         CRMSalesLine.mul_QuoteDesc.CreateInStream(MyInStream, TextEncoding::UTF8);
    //         CR[1] := 32;
    //         WorkDescription := TypeHelperCodeunit.ReadAsTextWithSeparator(MyInStream, CR[1]);
    //         exit(DELCHR(WorkDescription, '='));
    //     end
    // end;
    // //To be deployed in Version 132- end

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Sales Order to Sales Order", 'OnCreateNAVSalesOrderOnAfterSetLastBackOfficeSubmit', '', false, false)]
    local procedure OnCreateNAVSalesOrderOnAfterSetLastBackOfficeSubmitProduction(SalesHeader: Record "Sales Header")
    var

        ProdOrderfromSales: Codeunit "Create Prod. Order from Sale";
        SalesLines: Record "Sales Line";
        ProdOrderStatus: Enum "Production Order Status";
        OrderType: Option ItemOrder,ProjectOrder;
        Item: Record Item;
        SalesLines1: Record "Sales Line";
        ReservationLines: Record "Reservation Entry";
        ReservationLines1: Record "Reservation Entry";
        ReleaseProdOrderLine: Record "Prod. Order Line";
        ReleaseProdOrderComponent: Record "Prod. Order Component";
        SalesLines2: Record "Sales Line";
        MfgProcess: Codeunit "Mfg Process";
        ReleaseProdOrder: Record "Production Order";
        CRMProdOrderLines: Record "NIC CRM Prod Order Lines";
        TotalComponentPrice: Decimal;
    begin
        ProductionOrder(SalesHeader);
        ItemTrackingEntriesForSalesOrder(SalesHeader);
        // if (SalesHeader."NIC Work Order Options" = SalesHeader."NIC Work Order Options"::"Production Order") OR (SalesHeader."NIC Work Order Options" = SalesHeader."NIC Work Order Options"::"Production & Internal Order") then begin
        //     SalesLines.Reset();
        //     SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
        //     SalesLines.SetRange("Document No.", SalesHeader."No.");
        //     SalesLines.SetRange(Type, SalesLines.Type::Item);
        //     if SalesLines.FindSet() then begin
        //         Repeat
        //             if item.get(SalesLines."No.") then begin
        //                 if Item.Type = Item.Type::Inventory then begin
        //                     CRMProdOrderLines.Init();
        //                     CRMProdOrderLines."Document Type" := SalesLines."Document Type";
        //                     CRMProdOrderLines."Document No." := SalesLines."Document No.";
        //                     CRMProdOrderLines."FG Item No." := SalesHeader."NIC_FG Item No.";
        //                     CRMProdOrderLines."Item No." := SalesLines."No.";
        //                     CRMProdOrderLines."Line No." := SalesLines."Line No.";
        //                     CRMProdOrderLines."Serial No." := SalesLines."NIC_Serial No.";
        //                     CRMProdOrderLines.Quantity := SalesLines.Quantity;
        //                     CRMProdOrderLines."Location Code" := SalesLines."Location Code";
        //                     CRMProdOrderLines.Insert(true);
        //                     TotalComponentPrice += SalesLines."Unit Price";
        //                 end Else
        //                     TotalComponentPrice += SalesLines."Unit Price";
        //             end;
        //         until SalesLines.Next() = 0;

        //         if Item.Get(SalesHeader."NIC_FG Item No.") then begin
        //             SalesLines.InitNewLine(SalesLines1);
        //             SalesLines1.Copy(SalesLines);
        //             SalesLines1."Line No." := SalesLines."Line No." + 1;
        //             SalesLines1.Validate("No.", Item."No.");
        //             SalesLines1.Validate("Location Code", SalesLines."Location Code");
        //             SalesLines1.Validate(Quantity, SalesLines.Quantity);
        //             SalesLines1.Validate("Unit Price", TotalComponentPrice);
        //             SalesLines1.Component := false;
        //             SalesLines1."Need to Convert" := False;
        //             SalesLines1.Insert(true);
        //         end;

        //         SalesLines.Reset();
        //         SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
        //         SalesLines.SetRange("Document No.", SalesHeader."No.");
        //         SalesLines.SetFilter("No.", '<>%1', SalesHeader."NIC_FG Item No.");
        //         SalesLines.SetRange(Type, SalesLines.Type::Item);
        //         if SalesLines.FindSet() then
        //             SalesLines.DeleteAll();
        //     end;

        //     SalesLines.Reset();
        //     SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
        //     SalesLines.SetRange("Document No.", SalesHeader."No.");
        //     SalesLines.SetRange(Type, SalesLines.Type::Item);
        //     if SalesLines.FindSet() then begin
        //         Repeat
        //             if item.get(SalesLines."No.") then
        //                 if Item.Type = Item.Type::Inventory then begin
        //                     ProdOrderfromSales.CreateProductionOrder(SalesLines, ProdOrderStatus::Released, OrderType::ItemOrder);
        //                     Commit();
        //                     ReservationLines.reset();
        //                     ReservationLines.SetRange(ReservationLines."Source Subtype", ReservationLines."Source Subtype"::"1");
        //                     ReservationLines.SetRange(ReservationLines."Source Type", 37);
        //                     ReservationLines.SetRange(ReservationLines."Source ID", SalesLines."Document No.");
        //                     ReservationLines.SetRange(ReservationLines."Source Ref. No.", SalesLines."Line No.");
        //                     if ReservationLines.FindFirst() then begin
        //                         ReservationLines1.Reset();
        //                         ReservationLines1.SetRange("Entry No.", ReservationLines."Entry No.");
        //                         ReservationLines1.SetRange("Source Type", 5406);
        //                         if ReservationLines1.FindFirst() then begin
        //                             ReleaseProdOrderLine.Reset();
        //                             ReleaseProdOrderLine.SetRange("Prod. Order No.", ReservationLines1."Source ID");
        //                             ReleaseProdOrderLine.SetRange(Status, ReleaseProdOrderLine.Status::Released);
        //                             if ReleaseProdOrderLine.FindFirst() then begin
        //                                 CRMProdOrderLines.Reset();
        //                                 CRMProdOrderLines.SetRange("Document Type", CRMProdOrderLines."Document Type"::Order);
        //                                 CRMProdOrderLines.SetRange("Document No.", SalesHeader."No.");
        //                                 if CRMProdOrderLines.FindSet() then begin
        //                                     repeat
        //                                         ReleaseProdOrderComponent.Init();
        //                                         ReleaseProdOrderComponent."Prod. Order No." := ReleaseProdOrderLine."Prod. Order No.";
        //                                         ReleaseProdOrderComponent.Status := ReleaseProdOrderLine.Status;
        //                                         ReleaseProdOrderComponent."Prod. Order Line No." := ReleaseProdOrderLine."Line No.";
        //                                         ReleaseProdOrderComponent."Line No." := ReleaseProdOrderComponent."Line No." + Random(10000);
        //                                         ReleaseProdOrderComponent.Validate("Item No.", CRMProdOrderLines."Item No.");
        //                                         ReleaseProdOrderComponent.validate("Quantity per", CRMProdOrderLines.Quantity);
        //                                         ReleaseProdOrderComponent.validate("Location Code", CRMProdOrderLines."Location Code");
        //                                         ReleaseProdOrderComponent.Validate("NIC_Sr No.", CRMProdOrderLines."Serial No.");
        //                                         ReleaseProdOrderComponent.Insert(true);
        //                                     until CRMProdOrderLines.Next() = 0;
        //                                 end;
        //                             end;
        //                         end;
        //                     end;
        //                     ReleaseProdOrder.Reset();
        //                     ReleaseProdOrder.SetRange("No.", ReleaseProdOrderLine."Prod. Order No.");
        //                     ReleaseProdOrder.SetRange(Status, ReleaseProdOrderLine.Status);
        //                     if ReleaseProdOrder.FindFirst() then begin
        //                         if ReleaseProdOrder."NIC_Sr No." = '' then begin
        //                             ReleaseProdOrder."NIC_Sr No." := SalesHeader."NIC_FG Serial No.";
        //                             ReleaseProdOrder.Modify(false);
        //                         end;
        //                     end;
        //                     MfgProcess.Handling(ReleaseProdOrder, ReleaseProdOrderLine."Line No.");
        //                 end;
        //         until SalesLines.Next() = 0;
        //     end;
        // end;
        // //end;
        // //end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Sales Order to Sales Order", 'OnCreateSalesOrderHeaderOnBeforeSalesHeaderInsert', '', true, true)]
    local procedure OnSOHeaderOnBeforeSHeaderIns2(var SalesHeader: Record "Sales Header";
    CRMSalesorder: Record "CRM Salesorder");
    var
        CRMProduct: Record "CRM Product";
        Item: Record Item;
        CRMIntegrationRecord: Record "CRM Integration Record";
        NAVItemRecordId: RecordID;
        SalesSetup: Record "Sales & Receivables Setup";

    begin

        SalesSetup.get();
        SalesSetup.TestField("NIC CRM Order Location");
        SalesHeader.Validate("Location Code", SalesSetup."NIC CRM Order Location");
        SalesHeader."NIC Work Order Options" := CRMSalesorder."Work Order";
        SalesHeader."NIC_FG Serial No." := CRMSalesorder."FG Item Serial No.";
        if CRMIntegrationRecord.FindRecordIDFromID(CRMSalesorder."FG Item No.", Database::Item, NAVItemRecordId) then
            if Item.get(NAVItemRecordId) then
                SalesHeader.Validate("NIC_FG Item No.", Item."No.");

        // if Item."Item Tracking Code" <> '' then
        //     SalesHeader.TestField("NIC_FG Serial No.");

        //SalesHeader."Created By" := COPYSTR(CRMSalesorder.CreatedByName, 1, 80)
        //SalesHeader."External Document No." := CRMSalesorder.mul_CustomerPONumber;
        //SalesHeader."ICS Shipping Charge Assignment" := SalesHeader."ICS Shipping Charge Assignment"::"Shipping Application";
    end;

    procedure ProductionOrder(Var SalesHeader: Record "Sales Header");

    var
        ProdOrderfromSales: Codeunit "Create Prod. Order from Sale";
        SalesLines: Record "Sales Line";
        ProdOrderStatus: Enum "Production Order Status";
        OrderType: Option ItemOrder,ProjectOrder;
        Item: Record Item;
        SalesLines1: Record "Sales Line";
        ReservationLines: Record "Reservation Entry";
        ReservationLines1: Record "Reservation Entry";
        ReleaseProdOrderLine: Record "Prod. Order Line";
        ReleaseProdOrderComponent: Record "Prod. Order Component";
        SalesLines2: Record "Sales Line";
        MfgProcess: Codeunit "Mfg Process";
        ReleaseProdOrder: Record "Production Order";
        CRMProdOrderLines: Record "NIC CRM Prod Order Lines";
        TotalComponentPrice: Decimal;
        ComponentsEntered: Boolean;
        Item1: Record Item;
        Item2: Record Item;
    begin
        if (SalesHeader."NIC Work Order Options" = SalesHeader."NIC Work Order Options"::"Production Order") OR (SalesHeader."NIC Work Order Options" = SalesHeader."NIC Work Order Options"::"Production & Internal Order") then begin
            SalesLines.Reset();
            SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
            SalesLines.SetRange("Document No.", SalesHeader."No.");
            SalesLines.SetRange(Type, SalesLines.Type::Item);
            if SalesLines.FindSet() then begin
                Repeat
                    if Item1.get(SalesLines."No.") then begin
                        if Item1.Condition = Item1.Condition::Used then begin
                            Item2.Reset();
                            Item2.SetRange("Parent Item", Item."Parent Item");
                            Item2.SetRange(Item2.Condition, Item2.Condition::Refurbished);
                            if Item2.FindFirst() then begin
                                SalesHeader."NIC_FG Serial No." := SalesLines."NIC_Serial No.";
                                SalesHeader.Modify(false);
                            end;
                        end;
                    end;
                until SalesLines.Next() = 0;
            end;
            CRMProdOrderLines.Reset();
            CRMProdOrderLines.SetRange("Document Type", CRMProdOrderLines."Document Type"::Order);
            CRMProdOrderLines.SetRange("Document No.", SalesHeader."No.");
            if CRMProdOrderLines.FindSet() then
                ComponentsEntered := true;

            if Not ComponentsEntered then begin
                SalesLines.Reset();
                SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
                SalesLines.SetRange("Document No.", SalesHeader."No.");
                SalesLines.SetRange(Type, SalesLines.Type::Item);
                if SalesLines.FindSet() then begin
                    Repeat
                        CRMProdOrderLines.Init();
                        CRMProdOrderLines."Document Type" := SalesLines."Document Type";
                        CRMProdOrderLines."Document No." := SalesLines."Document No.";
                        CRMProdOrderLines."FG Item No." := SalesHeader."NIC_FG Item No.";
                        CRMProdOrderLines."Item No." := SalesLines."No.";
                        CRMProdOrderLines."Line No." := SalesLines."Line No.";
                        CRMProdOrderLines."Serial No." := SalesLines."NIC_Serial No.";
                        CRMProdOrderLines.Quantity := SalesLines.Quantity;
                        CRMProdOrderLines."Location Code" := SalesHeader."Location Code";
                        CRMProdOrderLines."Unit Price" := SalesLines."Unit Price";
                        if item.get(SalesLines."No.") then begin
                            if Not (Item.Type = Item.Type::Inventory) then
                                CRMProdOrderLines."Service Item" := true
                        end else
                            CRMProdOrderLines."Service Item" := true;
                        CRMProdOrderLines.Insert(true);
                        TotalComponentPrice += SalesLines."Unit Price";
                    // end Else
                    //     TotalComponentPrice += SalesLines."Unit Price";
                    //end;
                    until SalesLines.Next() = 0;

                    if Item.Get(SalesHeader."NIC_FG Item No.") then begin
                        SalesLines.InitNewLine(SalesLines1);
                        SalesLines1.Copy(SalesLines);
                        SalesLines1."Line No." := SalesLines."Line No." + 1;
                        SalesLines1.Validate("No.", Item."No.");
                        SalesLines1.Validate("Location Code", SalesLines."Location Code");
                        SalesLines1.Validate(Quantity, SalesLines.Quantity);
                        SalesLines1.Validate("Unit Price", TotalComponentPrice);
                        SalesLines1.Component := false;
                        SalesLines1."Need to Convert" := False;
                        SalesLines1.Insert(true);
                    end;

                    SalesLines.Reset();
                    SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
                    SalesLines.SetRange("Document No.", SalesHeader."No.");
                    SalesLines.SetFilter("No.", '<>%1', SalesHeader."NIC_FG Item No.");
                    SalesLines.SetRange(Type, SalesLines.Type::Item);
                    if SalesLines.FindSet() then
                        SalesLines.DeleteAll();
                end;
            end;

            SalesLines.Reset();
            SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
            SalesLines.SetRange("Document No.", SalesHeader."No.");
            SalesLines.SetRange(Type, SalesLines.Type::Item);
            if SalesLines.FindSet() then begin
                Repeat
                    if item.get(SalesLines."No.") then
                        if Item.Type = Item.Type::Inventory then begin
                            ProdOrderfromSales.CreateProductionOrder(SalesLines, ProdOrderStatus::Released, OrderType::ItemOrder);
                            Commit();
                            ReservationLines.reset();
                            ReservationLines.SetRange(ReservationLines."Source Subtype", ReservationLines."Source Subtype"::"1");
                            ReservationLines.SetRange(ReservationLines."Source Type", 37);
                            ReservationLines.SetRange(ReservationLines."Source ID", SalesLines."Document No.");
                            ReservationLines.SetRange(ReservationLines."Source Ref. No.", SalesLines."Line No.");
                            if ReservationLines.FindFirst() then begin
                                ReservationLines1.Reset();
                                ReservationLines1.SetRange("Entry No.", ReservationLines."Entry No.");
                                ReservationLines1.SetRange("Source Type", 5406);
                                if ReservationLines1.FindFirst() then begin
                                    ReleaseProdOrderLine.Reset();
                                    ReleaseProdOrderLine.SetRange("Prod. Order No.", ReservationLines1."Source ID");
                                    ReleaseProdOrderLine.SetRange(Status, ReleaseProdOrderLine.Status::Released);
                                    if ReleaseProdOrderLine.FindFirst() then begin
                                        CRMProdOrderLines.Reset();
                                        CRMProdOrderLines.SetRange("Document Type", CRMProdOrderLines."Document Type"::Order);
                                        CRMProdOrderLines.SetRange("Document No.", SalesHeader."No.");
                                        CRMProdOrderLines.SetRange("Service Item", false);
                                        if CRMProdOrderLines.FindSet() then begin
                                            repeat
                                                if Not ComponentsEntered then begin
                                                    ReleaseProdOrderComponent.Init();
                                                    ReleaseProdOrderComponent."Prod. Order No." := ReleaseProdOrderLine."Prod. Order No.";
                                                    ReleaseProdOrderComponent.Status := ReleaseProdOrderLine.Status;
                                                    ReleaseProdOrderComponent."Prod. Order Line No." := ReleaseProdOrderLine."Line No.";
                                                    ReleaseProdOrderComponent."Line No." := ReleaseProdOrderComponent."Line No." + Random(10000);
                                                    ReleaseProdOrderComponent.Validate("Item No.", CRMProdOrderLines."Item No.");
                                                    ReleaseProdOrderComponent.validate("Quantity per", CRMProdOrderLines.Quantity);
                                                    ReleaseProdOrderComponent.validate("Location Code", CRMProdOrderLines."Location Code");
                                                    ReleaseProdOrderComponent.Validate("NIC_Sr No.", CRMProdOrderLines."Serial No.");
                                                    ReleaseProdOrderComponent.Validate("Unit Cost", CRMProdOrderLines."Unit Price");
                                                    ReleaseProdOrderComponent.Insert(true);
                                                end;
                                            until CRMProdOrderLines.Next() = 0;
                                        end;
                                    end;
                                end;
                            end;
                            ReleaseProdOrder.Reset();
                            ReleaseProdOrder.SetRange("No.", ReleaseProdOrderLine."Prod. Order No.");
                            ReleaseProdOrder.SetRange(Status, ReleaseProdOrderLine.Status);
                            if ReleaseProdOrder.FindFirst() then begin
                                if ReleaseProdOrder."NIC_Sr No." = '' then begin
                                    ReleaseProdOrder."NIC_Sr No." := SalesHeader."NIC_FG Serial No.";
                                    ReleaseProdOrder.Modify(false);
                                end;
                            end;
                            MfgProcess.Handling(ReleaseProdOrder, ReleaseProdOrderLine."Line No.");
                        end;
                until SalesLines.Next() = 0;
            end;
        end;
    end;

    local procedure ItemTrackingEntriesForSalesOrder(SalesHeader: Record "Sales Header")
    var
        SalesLines: Record "Sales Line";
        ReservationEntriesforSales: Record "Reservation Entry";
        ReservationEntriesforSalesLast: Record "Reservation Entry";
        item: Record Item;
    begin
        if SalesHeader."NIC Work Order Options" in [SalesHeader."NIC Work Order Options"::"Incident Base Order", SalesHeader."NIC Work Order Options"::"Repair Order", SalesHeader."NIC Work Order Options"::"Sales Order"] then begin
            SalesLines.Reset();
            SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
            SalesLines.SetRange("Document No.", SalesHeader."No.");
            SalesLines.SetRange(Type, SalesLines.Type::Item);
            if SalesLines.FindSet() then begin
                Repeat
                    if item.get(SalesLines."No.") then
                        if item."Item Tracking Code" <> '' then
                            if SalesLines."NIC_Serial No." <> '' then begin
                                if ReservationEntriesforSalesLast.FindLast() then;
                                ReservationEntriesforSales.Init();
                                ReservationEntriesforSales."Entry No." := ReservationEntriesforSalesLast."Entry No." + 1;
                                ReservationEntriesforSales."Reservation Status" := ReservationEntriesforSales."Reservation Status"::Surplus;
                                ReservationEntriesforSales.Validate("Item No.", SalesLines."No.");
                                ReservationEntriesforSales.Validate(Quantity, (-1) * SalesLines.Quantity);
                                ReservationEntriesforSales.Validate("Location Code", SalesLines."Location Code");
                                ReservationEntriesforSales.Validate("Quantity (Base)", (-1) * SalesLines."Quantity (Base)");
                                ReservationEntriesforSales.Validate(Positive, false);
                                ReservationEntriesforSales.Validate("Source Subtype", ReservationEntriesforSales."Source Subtype"::"1");
                                ReservationEntriesforSales.Validate("Source Type", 37);
                                ReservationEntriesforSales.Validate("Source ID", SalesLines."Document No.");
                                ReservationEntriesforSales.Validate("Source Ref. No.", SalesLines."Line No.");
                                ReservationEntriesforSales.Validate("Serial No.", SalesLines."NIC_Serial No.");
                                ReservationEntriesforSales.Validate("Item Tracking", ReservationEntriesforSales."Item Tracking"::"Serial No.");
                                ReservationEntriesforSales.Insert(true);
                            end;
                until SalesLines.Next() = 0;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post", 'OnBeforeCode', '', false, false)]
    local procedure OnBeforeCodeHideConfirmation(var HideDialog: Boolean; var IsHandled: Boolean; var ItemJournalLine: Record "Item Journal Line"; var SuppressCommit: Boolean)
    begin
        if ItemJournalLine."Order Type" = ItemJournalLine."Order Type"::Production then
            HideDialog := true;

    end;



}
