tableextension 50004 "NIC Purchase & Pay Setup" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "OEM Nos."; Code[20])
        {
            Caption = 'OEM Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
