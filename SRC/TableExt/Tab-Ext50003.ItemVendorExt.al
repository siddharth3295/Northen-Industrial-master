tableextension 50003 "Item Vendor Ext" extends "Item Vendor"
{
    fields
    {
        field(50000; "Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Unit Cost Checked on"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Quantity Available"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50030; "Quantity Checked on"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50040; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50120; "Vendor Name 2"; Text[100])
        {
            Caption = 'Vendor Name';
            DataClassification = ToBeClassified;
        }
        field(50001; Inventory; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Vendor Item Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Country/Region Code"; Code[10])
        {
            Caption = 'Country';
            TableRelation = "Country/Region";
        }
        field(50004; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
    }
}