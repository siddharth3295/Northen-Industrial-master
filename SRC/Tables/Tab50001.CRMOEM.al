table 50001 "CRM OEM"
{
    TableType = CDS;
    ExternalName = 'new_oem';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
            ExternalName = 'new_code';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(2; Name; Text[120])
        {
            Caption = 'Name';
            ExternalName = 'new_name';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }

}
