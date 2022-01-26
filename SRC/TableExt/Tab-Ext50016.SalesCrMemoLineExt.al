tableextension 50016 "Sales Cr. Memo Line Ext" extends "Sales Cr.Memo Line"
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
