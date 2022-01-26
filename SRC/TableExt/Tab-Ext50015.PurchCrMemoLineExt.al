tableextension 50015 "Purch. Cr Memo Line Ext" extends "Purch. Cr. Memo Line"
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
