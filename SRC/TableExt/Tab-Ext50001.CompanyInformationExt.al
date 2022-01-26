tableextension 50001 "Company Information Ext" extends "Company Information"
{
    fields
    {
        field(50000; "Master Company"; Boolean)
        {
            Caption = 'Master Company';
            DataClassification = ToBeClassified;
        }
    }
}
