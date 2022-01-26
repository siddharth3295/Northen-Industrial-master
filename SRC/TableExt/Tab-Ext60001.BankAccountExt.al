tableextension 60001 "Bank Account Ext" extends "Bank Account"
{
    fields
    {
        field(50001; "Reporting Bank"; Boolean)
        {
            Caption = 'Reporting Bank';
            DataClassification = ToBeClassified;
        }
    }
}
