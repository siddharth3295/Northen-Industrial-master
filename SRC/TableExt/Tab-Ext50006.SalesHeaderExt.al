tableextension 50006 "Sales Header Ext." extends "Sales Header"
{
    fields
    {
        field(50000; "NIC_Work Order"; Boolean)
        {
            //Editable = false;
            Caption = 'Work Order Obsolete';
            DataClassification = ToBeClassified;
        }
        field(50001; "NIC_FG Item No."; Text[20])
        {
            //Editable = false;
            Caption = 'FG Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
        field(50002; "NIC_FG Item ID."; Guid)
        {
            //Editable = false;
            Caption = 'FG Item Id.';
            DataClassification = ToBeClassified;
            trigger onvalidate()
            var
                CRMProdut: Record "CRM Product";
            begin
                CRMProdut.Reset();
                CRMProdut.SetRange(ProductId, "NIC_FG Item ID.");
                if CRMProdut.FindFirst() then begin
                    "NIC_FG Item No." := CRMProdut.ProductNumber;
                end;
            end;
        }
        field(50004; "NIC_FG Serial No."; Code[20])
        {
            //Editable = false;
            Caption = 'FG Serial No.';
            DataClassification = ToBeClassified;
        }

        field(50005; "NIC Work Order Options"; Option)
        {
            Caption = 'Work Order';
            DataClassification = ToBeClassified;
            OptionMembers = "Production Order","Production & Internal Order","Incident Base Order","Sales Order","Repair Order";
        }
        field(50006; Remark; Text[150])
        {
            DataClassification = ToBeClassified;
        }
    }
}
