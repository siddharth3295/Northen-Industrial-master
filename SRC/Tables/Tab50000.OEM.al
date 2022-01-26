table 50000 OEM
{
    Caption = 'OEM';
    LookupPageId = "OEM List Page list";
    DrillDownPageId = "OEM List Page List";
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // begin
            //     if "Code" <> xRec."Code" then begin
            //         PurchasePaySetup.Get();
            //         NoSeriesMgt.TestManual(PurchasePaySetup."OEM Nos.");
            //     end;
            // end;

        }
        field(2; Name; Text[120])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; OEM; Guid)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "OEM Type"; Enum "OEM type")
        {
            DataClassification = ToBeClassified;
        }
        field(5; RecordId; RecordId)
        {
            DataClassification = ToBeClassified;
        }
    }


    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        PurchasePaySetup.get();
        PurchasePaySetup.TestField("OEM Nos.");
        Rec."Code" := NoSeriesMgt.GetNextNo(PurchasePaySetup."OEM Nos.", Today, true)
    end;

    var

        PurchasePaySetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}