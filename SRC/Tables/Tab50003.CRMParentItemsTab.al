table 50003 "CRM Parent Items"
{
    TableType = CDS;
    ExternalName = 'new_productparentitem';
    // ExternalSchema = '';

    fields
    {
        field(1; "No."; Code[17])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            ExternalName = 'new_code';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
            ExternalName = 'new_name';
            ExternalType = 'String';
            ExternalAccess = Full;
        }

        field(3; "Description 2"; Text[100])
        {
            Caption = 'Description 2';
            DataClassification = ToBeClassified;
            ExternalName = 'new_description2';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(4; "Search Description"; text[100])
        {
            Caption = 'Search Description';
            DataClassification = ToBeClassified;
            ExternalName = 'new_searchdescription';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(5; "Automatic Ext. Texts"; Boolean)
        {
            Caption = 'Automatic Ext. Texts';
            DataClassification = ToBeClassified;
            ExternalName = 'new_automaticexttext';
            ExternalType = 'Boolean';
            ExternalAccess = Full;
        }
        field(6; "Basic Unit of Meassure"; Code[10])
        {
            Caption = 'Basic Unit of Meassure';
            DataClassification = ToBeClassified;
            ExternalName = 'new_customdefaultunit';
            ExternalType = 'String';
            ExternalAccess = Full;
            //TableRelation = "CRM Uom".UoMId;
        }

        field(20; "Life Stage"; Enum "Life Stage")
        {
            Caption = 'Life Stage';
            DataClassification = ToBeClassified;
            ExternalName = 'new_lifestage';
            ExternalType = 'Picklist';
            ExternalAccess = Full;

        }
        field(21; Salmasid; Text[20])
        {
            Caption = 'Salmasid';
            DataClassification = ToBeClassified;
            ExternalName = 'new_salmasid';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(22; iddeladd; Text[20])
        {
            Caption = 'iddeladd';
            DataClassification = ToBeClassified;
            ExternalName = 'new_iddeladd';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(23; magentoid; Text[20])
        {
            Caption = 'Basic Unit of Meassure';
            DataClassification = ToBeClassified;
            ExternalName = 'new_magentoid';
            ExternalType = 'String';
            ExternalAccess = Full;
        }

        // field(25; DefaultUoMScheduleId; Guid)
        // {
        //     Caption = 'Unit Group';
        //     Description = 'Default unit group for the product.';
        //     ExternalName = 'new_defaultuomscheduleid';
        //     ExternalType = 'Lookup';
        //     TableRelation = "CRM Uomschedule".UoMScheduleId;
        // }
        // field(25; DefaultUoMId; Guid)
        // {
        //     Caption = 'Default Unit';
        //     Description = 'Default unit for the product.';
        //     ExternalName = 'defaultuomid';
        //     ExternalType = 'Lookup';
        //     TableRelation = "CRM Uom".UoMId;
        // }
        field(7; OEM; Code[20])
        {
            Caption = 'OEM';
            DataClassification = ToBeClassified;
            ExternalName = 'new_oem';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(8; EAN; Text[80])
        {
            Caption = 'EAN';
            ExternalName = 'new_ean';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(9; GTIN; Code[14])
        {
            Caption = 'GTIN';
            ExternalName = 'new_gtin';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(10; "Net Weight"; Decimal)
        {
            Caption = 'Net Weight';
            ExternalName = 'new_netweight';
            ExternalType = 'Double';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(11; "Gross Weight"; Decimal)
        {
            Caption = 'Gross Weight';
            ExternalName = 'new_grossweight';
            ExternalType = 'Double';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(12; "Unit Volume"; Decimal)
        {
            Caption = 'Unit Volume';
            ExternalName = 'new_unitvolume';
            ExternalType = 'Double';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        // field(13; "No. of Images"; Integer)
        // {
        //     Caption = 'No. of Images';
        //     Editable = false;
        //     ExternalName = '';
        //     ExternalType = 'Integer';
        //     ExternalAccess = Full;
        //     DataClassification = ToBeClassified;
        // }
        field(14; "Tariff No."; Code[20])
        {
            Caption = 'Tariff No.';
            ExternalName = 'new_tariffno';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(15; "Import Tariff Code"; Text[20])
        {
            Caption = 'Import Tariff Code';
            ExternalName = 'new_importtariffcode';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(16; "Export Tariff Code"; Text[20])
        {
            Caption = 'Export Tariff Code';
            ExternalName = 'new_exporttariffcode';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(17; "Available New"; Boolean)
        {
            Caption = 'Available New';
            ExternalName = 'new_newconditionavailable';
            ExternalType = 'Boolean';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(18; "Available Refurbished"; Boolean)
        {
            Caption = 'Available Refurbished';
            ExternalName = 'new_refurbishedconditionavailable';
            ExternalType = 'Boolean';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(19; "Available Used"; Boolean)
        {
            Caption = 'Available Used';
            ExternalName = 'new_usedconditionavailable';
            ExternalType = 'Boolean';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(24; "UOM Group"; Code[200])
        {
            Caption = 'UOM Group';
            DataClassification = ToBeClassified;
            ExternalName = 'new_customunitgroup';
            ExternalType = 'String';
            ExternalAccess = Full;
            //TableRelation = "CRM Uom".UoMId;
        }
        field(25; "new_newopenboxconditionavailable"; Boolean)
        {
            Caption = 'new_newopenboxconditionavailable';
            DataClassification = ToBeClassified;
            ExternalName = 'new_newopenboxconditionavailable';
            ExternalType = 'Boolean';
            ExternalAccess = Full;

        }

        // field(20; "Available Repaired"; Boolean)
        // {
        //     Caption = 'Available Repaired';
        //     ExternalName = '';
        //     ExternalType = 'Boolean';
        //     ExternalAccess = Full;
        //     DataClassification = ToBeClassified;
        // }
        // field(21; "New Item"; Code[20])
        // {
        //     Caption = 'New Item';
        //     Editable = false;
        //     ExternalName = 'new_NewProduct';
        //     ExternalType = 'String';
        //     ExternalAccess = Full;
        // }
        // field(22; "Refurbished Item"; Code[20])
        // {
        //     Caption = 'Refurbished Item';
        //     Editable = false;
        //     ExternalName = 'new_RefurbishedProduct';
        //     ExternalType = 'String';
        //     ExternalAccess = Full;
        // }
        // field(23; "Used Item"; Code[20])
        // {
        //     Caption = 'Used Item';
        //     Editable = false;
        //     ExternalName = 'new_UsedProduct';
        //     ExternalType = 'String';
        //     ExternalAccess = Full;
        // }
        // field(24; "Repaired Item"; Code[20])
        // {
        //     Caption = 'Repaired Item';
        //     Editable = false;
        //     ExternalName = 'new_RepairedProduct';
        //     ExternalType = 'String';
        //     ExternalAccess = Full;
        // }
        field(26; "Country/Region of Origin Code"; code[10])
        {
            ExternalName = 'new_countryoforigin';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(27; ModifiedOn; DateTime)
        {
            Caption = 'Modified On';
            Description = 'Date and time when the product was last modified.';
            ExternalAccess = Read;
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
        }
        field(28; new_productparentitemid; Guid)
        {
            Caption = 'new_productparentitemid';
            ExternalType = 'Uniqueidentifier';
            ExternalName = 'new_productparentitemid';
        }
        field(29; "UOM GUID"; Guid)
        {
            Caption = 'UOM GUID';
            ExternalType = 'Lookup';
            ExternalName = 'new_defaultunit';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
            Enabled = true;
            TableRelation = "CRM Uom".BaseUoM;
        }
        field(30; "UOM Group GUID"; Guid)
        {
            Caption = 'UOM Group GUID';
            ExternalType = 'Lookup';
            ExternalName = 'new_defaultuomscheduleid';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
            Enabled = true;
            TableRelation = "CRM Uomschedule".UoMScheduleId;
        }
        field(31; "Part No."; Code[50])
        {
            Caption = 'Part No.';
            ExternalType = 'String';
            ExternalName = 'new_partno';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
            Enabled = true;

        }
        //

        //
    }
    keys
    {
        key(PK; new_productparentitemid)
        {
            Clustered = true;
        }
    }
}