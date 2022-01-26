tableextension 50002 "CRM Product Ext" extends "CRM Product"
{
    fields
    {
        field(50000; "Parent Item"; Code[20])
        {
            Caption = 'Parent Item';
            ExternalType = '';
            ExternalName = '2342 new_parentitemnoid';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(50100; "Competitor Average"; Decimal)
        {

            ExternalType = 'Money';
            ExternalName = 'new_competitoraverage';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(50110; "Market Average"; Decimal)
        {
            ExternalType = 'Money';
            ExternalName = 'new_marketaverage';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(50120; "Recommended Price"; Decimal)
        {
            ExternalType = 'Money';
            ExternalName = 'new_recommendedprice';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(50130; Condition; Enum "Condition Enum")
        {
            Caption = 'Condition';
            ExternalType = 'Picklist';
            ExternalName = 'new_condition';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(50140; msdyn_fieldserviceproducttype; Option)
        {
            Caption = 'msdyn_fieldserviceproducttype';
            ExternalType = 'Picklist';
            ExternalName = 'msdyn_fieldserviceproducttype';
            ExternalAccess = Full;
            InitValue = Inventory;
            OptionMembers = Inventory,"Non-Inventory",Service;
            DataClassification = ToBeClassified;
            OptionOrdinalValues = 690970000, 690970001, 690970002;
        }
        field(50141; new_QuantityonSalesOrder; Decimal)
        {
            Caption = 'new_QuantityonSalesOrder';
            ExternalType = 'Decimal';
            ExternalName = 'new_quantityonsalesorder';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        // field(50142; new_quantityavailable; Decimal)
        // {
        //     Caption = 'new_quantityavailable';
        //     ExternalType = 'Decimal';
        //     ExternalName = 'new_quantityavailable';
        //     ExternalAccess = Full;
        //     DataClassification = ToBeClassified;
        // }

        field(50143; OEM; Code[20])
        {
            Caption = 'OEM';
            DataClassification = ToBeClassified;
            ExternalName = 'new_oem';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(50144; EAN; Text[80])
        {
            Caption = 'EAN';
            ExternalName = 'new_ean';
            ExternalType = 'String';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
        }
        field(50145; "Life Stage"; Enum "Life Stage")
        {
            Caption = 'Life Stage';
            DataClassification = ToBeClassified;
            ExternalName = 'new_lifestage';
            ExternalType = 'Picklist';
            ExternalAccess = Full;

        }
        field(50146; Salmasid; Text[20])
        {
            Caption = 'Salmasid';
            DataClassification = ToBeClassified;
            ExternalName = 'new_salmasid';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(50147; iddeladd; Text[20])
        {
            Caption = 'iddeladd';
            DataClassification = ToBeClassified;
            ExternalName = 'new_iddeladd';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(50148; magentoid; Text[20])
        {
            Caption = 'Basic Unit of Meassure';
            DataClassification = ToBeClassified;
            ExternalName = 'new_magentoid';
            ExternalType = 'String';
            ExternalAccess = Full;
        }

        field(50149; new_searchdescription; Text[100])
        {
            Caption = 'new_searchdescription';
            DataClassification = ToBeClassified;
            ExternalName = 'new_searchdescription';
            ExternalType = 'String';
            ExternalAccess = Full;
        }
        field(50150; new_CountryofOrigin; Code[10])
        {
            Caption = 'new_CountryofOrigin';
            DataClassification = ToBeClassified;
            ExternalName = 'new_countryoforigin';
            ExternalType = 'String';
            ExternalAccess = Full;
        }

        field(50151; "Parent Item GUID"; Guid)
        {
            Caption = 'Parent Item GUID';
            ExternalType = 'Lookup';
            ExternalName = 'new_parentitemnoid';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
            Enabled = true;
            TableRelation = "CRM Parent Items".new_productparentitemid;
        }
        field(50152; "Part No."; Code[50])
        {
            Caption = 'Part No.';
            ExternalType = 'String';
            ExternalName = 'new_partno';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
            Enabled = true;

        }
        field(50153; "Description 2"; text[50])
        {
            Caption = 'Description 2';
            ExternalType = 'String';
            ExternalName = 'description';
            ExternalAccess = Full;
            DataClassification = ToBeClassified;
            Enabled = true;

        }


    }
}