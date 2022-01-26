tableextension 50017 "Sales Shipment Line Ext" extends "Sales Shipment Line"
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
