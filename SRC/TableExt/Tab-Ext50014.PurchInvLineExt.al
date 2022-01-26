tableextension 50014 "Purch. Inv. Line Ext" extends "Purch. Inv. Line"
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
