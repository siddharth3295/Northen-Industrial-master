tableextension 50000 "Item Ext" extends Item
{
    fields
    {
        field(50000; "Parent Item"; Code[20])
        {
            Caption = 'Parent Item';
            Editable = false;
            TableRelation = "Parent Items"."No.";
        }
        field(50001; "Parent Item Id"; Guid)
        {
            DataClassification = ToBeClassified;
            Enabled = true;
        }
        field(50002; "CRM Id"; Guid)
        {
            DataClassification = ToBeClassified;
        }
        field(50100; "Competitor Average"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Market Average"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50120; "Recommended Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50130; Condition; Enum "Condition Enum")
        {
            Caption = 'Condition';
            //Editable = false;
            DataClassification = ToBeClassified;
        }
        field(50140; Salmasid; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50141; iddeladd; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50142; magentoid; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50200; "OEM"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50205; "OEM Code"; Code[20])
        {
            Caption = 'OEM';
            Editable = false;
            TableRelation = OEM.Code;
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // var
            //     OEMRecLVar: Record OEM;
            // begin
            //     if OEMRecLVar.Get(Rec."OEM Code") then
            //         Rec.Validate(OEM, OEMRecLVar.Name);
            // end;
        }
        field(50250; EAN; text[100])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(50260; "Export Tariff Code"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50270; "Impot Tariff Code"; text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50271; "Life Stage"; Enum "Life Stage")
        {
            DataClassification = ToBeClassified;

        }
        field(50272; "Type as Integer"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'CRM Item Type';

            // ExternalName = 'msdyn_ordertype';
            // ExternalType = 'Picklist';
            // Description = 'Internal use only';
            // Caption = 'Order Type';
            //InitValue = Inventory;
            OptionMembers = Inventory,"Non-Inventory",Service;
            //OptionOrdinalValues = 690970000, 690970001, 690970002;


        }
        field(50273; "Part Code"; Code[50])
        {
            Caption = 'Part Code';
            DataClassification = ToBeClassified;
        }
        field(50274; "Part/Components"; enum "Part/Components")
        {
            Caption = 'Part Or Components';
            DataClassification = ToBeClassified;
        }
    }
    trigger oninsert()
    begin

        Rec.Validate(Condition, Condition::New);

        if "Parent Item" = '' then
            Rec.Validate("Part/Components", "Part/Components"::Component)
        Else
            Rec.Validate("Part/Components", "Part/Components"::Part);

        if Type = Type::Service then
            Rec.Validate("Part/Components", "Part/Components"::" ");

        if Type = Type::Service then
            Rec.Validate("Part/Components", "Part/Components"::" ");
    end;

    trigger OnModify()
    begin
        if "Parent Item" = '' then
            Rec.Validate("Part/Components", "Part/Components"::Component)
        Else
            Rec.Validate("Part/Components", "Part/Components"::Part);

        if Type = Type::Service then
            Rec.Validate("Part/Components", "Part/Components"::" ");

        if Type = Type::Service then
            Rec.Validate("Part/Components", "Part/Components"::" ");
    end;
}
