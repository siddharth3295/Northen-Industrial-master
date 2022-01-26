table 50010 "NIC CRM Prod Order Lines"
{
    Caption = 'CRM Prod Order Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(4; "FG Item No."; Code[20])
        {
            Caption = 'FG Item No.';
            DataClassification = ToBeClassified;
        }
        field(5; "Serial No."; Code[20])
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(6; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(8; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        field(9; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;
        }
        field(10; "Service Item"; Boolean)
        {
            Caption = 'Service Item';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.", "Document Type", "Line No.")
        {
            Clustered = true;
        }
    }
}
