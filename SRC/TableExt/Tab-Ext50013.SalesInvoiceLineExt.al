tableextension 50013 "Sales Invoice Line Ext" extends "Sales Invoice Line"
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
