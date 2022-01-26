tableextension 50009 CRMSODetailsTabExt extends "CRM Salesorderdetail"
{
    fields
    {
        field(50000; "Serial No"; Text[20])
        {
            ExternalName = 'new_serialno';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;

        }
    }
}
