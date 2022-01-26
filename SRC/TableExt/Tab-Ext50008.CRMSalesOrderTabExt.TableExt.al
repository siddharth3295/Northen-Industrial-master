tableextension 50008 CRMSalesOrderTabExt extends "CRM Salesorder"
{
    fields
    {
        field(50000; "Work Order"; Option)
        {
            ExternalName = 'new_customordertype';
            ExternalType = 'Picklist';
            ExternalAccess = Full;
            InitValue = "Sales Order";
            DataClassification = ToBeClassified;
            OptionMembers = "Production Order","Production & Internal Order","Incident Base Order","Sales Order","Repair Order";
            OptionOrdinalValues = 100000000, 100000001, 100000002, 100000003, 100000004;


        }
        field(50001; "FG Item No."; Guid)
        {
            ExternalName = 'new_woproduct';
            ExternalType = 'Lookup';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
            TableRelation = "CRM Product".ProductId;
        }

        field(50002; "FG Item Serial No."; Text[20])
        {
            ExternalName = 'new_productserialno';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
            TableRelation = "CRM Product".ProductId;
        }

    }
}
