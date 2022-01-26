table 50011 "Vendor Item Buffer"
{
    Caption = 'Vendor Item Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Vendor Code"; Code[20])
        {
            Caption = 'Vendor Code';
            DataClassification = ToBeClassified;
        }
        field(2; "Part Code"; Code[50])
        {
            Caption = 'Part Code';
            DataClassification = ToBeClassified;
        }
        field(3; Condition; Enum "Condition Enum")
        {
            Caption = 'Condition';
            DataClassification = ToBeClassified;
        }
        field(4; "Cost Price"; Decimal)
        {
            Caption = 'Cost Price';
            DataClassification = ToBeClassified;
        }
        field(5; "Qty Available"; Decimal)
        {
            Caption = 'Qty Available';
            DataClassification = ToBeClassified;
        }
        field(6; "Country"; Code[10])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region".Code;
        }
        field(7; "Vendor Item Name"; text[100])
        {
            Caption = 'Vendor Item Name';
            DataClassification = ToBeClassified;

        }
        field(8; "Lead Time Calculation"; DateFormula)
        {
            Caption = 'Lead Time Calculation';
            DataClassification = ToBeClassified;

        }
        field(9; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;

        }
        field(10; "File Name"; Text[50])
        {
            Caption = 'File Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(11; "Sheet Name"; Text[30])
        {
            Caption = 'Sheet Name';
            DataClassification = CustomerContent;
        }
        field(12; "Imported Date"; Date)
        {
            Caption = 'Imported Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(13; "Imported Time"; Time)
        {
            Caption = 'Imported Time';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(14; "Error Context"; Text[150])
        {
            Caption = 'Error Context';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(15; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            Editable = false;
            TableRelation = Item;
            DataClassification = CustomerContent;
        }
        field(16; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
            TableRelation = Currency.Code;
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
}
