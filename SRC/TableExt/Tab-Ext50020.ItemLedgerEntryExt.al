tableextension 50020 "Item Ledger Entry Ext" extends "Item Ledger Entry"
{
    fields
    {
        field(50004; "Part Code"; Code[50])
        {
            Caption = 'Part Code';
            DataClassification = ToBeClassified;
        }
    }
}
