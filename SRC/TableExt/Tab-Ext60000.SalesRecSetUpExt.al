tableextension 60000 "Sales&RecSetUpExt" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50001; Email; Text[100])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
        }
        field(50002; "NIC CRM Order Location"; Code[20])
        {
            Caption = 'CRM Order Location';
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
    }
}
