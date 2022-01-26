table 50007 CRM_VATProductPostingGroup
{
    Caption = 'CRM_VATProductPostingGroup';
    TableType = CRM;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
            ExternalName = 'VPPG_Code';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            ExternalName = 'VPPG_Name';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

}
