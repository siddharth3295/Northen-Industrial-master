table 50004 "CRM Country"
{
    Caption = 'CRM Country';
    TableType = CRM;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            ExternalName = 'new_code';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            ExternalName = 'new_name';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(4; "ISO Code"; Code[2])
        {
            Caption = 'ISO Code';
            ExternalName = 'new_isocode';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(5; "ISO Numeric Code"; Code[3])
        {
            Caption = 'ISO Numeric Code';
            ExternalName = 'new_isonumericcode';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(6; "EU Country/Region Code"; Code[10])
        {
            Caption = 'EU Country/Region Code';
            ExternalName = 'new_eucountryregioncode';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(7; "Intrastat Code"; Code[10])
        {
            Caption = 'Intrastat Code';
            ExternalName = 'new_intrastatcode';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(10; "VAT Scheme"; Code[10])
        {
            Caption = 'VAT Scheme';
            ExternalName = 'new_vatscheme';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(11; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
            ExternalAccess = Full;
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