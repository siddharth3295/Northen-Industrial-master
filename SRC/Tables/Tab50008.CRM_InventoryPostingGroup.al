table 50008 CRM_InventoryPostingGroup
{
    Caption = 'CRM_InventoryPostingGroup';
    TableType = CRM;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
            ExternalName = 'IPG_Code';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            ExternalName = 'IPG_Name';
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
