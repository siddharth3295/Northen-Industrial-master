table 50005 "CRM Product Vendor"
{
    TableType = CRM;

    fields
    {
        field(1; "Product Vendor"; Code[20])
        {
            ExternalName = 'Product Vendor';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(2; "Vendor No."; code[20])
        {
            ExternalName = 'Vendor No.';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(6; "Lead Time"; DateFormula)
        {
            ExternalName = 'Lead Time';
            ExternalType = 'Time';
            ExternalAccess = Full;
        }
        field(7; "Vendor Item No."; Text[50])
        {
            ExternalName = 'Vendor Item No.';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(50000; "Unit Cost"; Decimal)
        {
            ExternalName = 'Unit Cost';
            ExternalType = 'Decimal';
            ExternalAccess = Full;
        }
        field(50010; "Unit Cost Checked on"; Date)
        {
            ExternalName = 'Unit Cost Checked On';
            ExternalType = 'Date';
            ExternalAccess = Full;
        }
        field(50020; "Quantity Available"; Decimal)
        {
            ExternalName = 'Quantity Available';
            ExternalType = 'Decimal';
            ExternalAccess = Full;
        }
        field(50030; "Quantity Checked On"; Date)
        {
            ExternalType = 'Date';
            ExternalName = 'Quantity Checked On';
            ExternalAccess = Full;
        }
        field(50040; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            ExternalName = 'Expiry Date';
            ExternalType = 'Date';
            ExternalAccess = Full;
        }
        field(50110; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            ExternalName = 'Name';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(50120; "Vendor Name 2"; Text[100])
        {
            Caption = 'Vendor Name';
            ExternalName = 'On Ebay';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
    }
    keys
    {
        key(PK; "Product Vendor")
        {
            Clustered = true;
        }
    }
}
