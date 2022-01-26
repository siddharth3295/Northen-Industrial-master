tableextension 50010 "NIC_Production Order Header" extends "Production Order"
{
    fields
    {
        field(50000; "NIC_Sr No."; Code[20])
        {
            Caption = 'NIC_Sr No.';
            DataClassification = ToBeClassified;
        }
    }
}
