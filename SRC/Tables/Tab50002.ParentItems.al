table 50002 "Parent Items"
{
    Caption = 'Parent Items';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Parent Items";
    LookupPageId = "Parent Items";

    fields
    {
        field(1; "No."; Code[17])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            // StringLength: Integer;
            // i: Integer;
            begin
                // StringLength := StrLen(Rec."Part Code");
                // for I := 1 to StringLength do begin
                //     Rec.Validate(Rec."Without Special Character", DelChr(Rec."Part Code", '=', SpecialCharavar));
                // end;
                // Rec.Validate(Rec."Lower Description", LowerCase(Rec."Without Special Character"));
                // ParentItemRec.Reset();
                // if ParentItemRec.FindSet() then
                //     repeat
                //         if (ParentItemRec."Lower Description" = Rec."Lower Description") then
                //             // if ParentItemRec."Without Special Character" = Rec."Without Special Character" then
                //             Error(Descrierror, Rec."Without Special Character");
                //     until ParentItemRec.Next() = 0;
            end;
        }

        field(3; "Description 2"; Text[100])
        {
            Caption = 'Description 2';
            DataClassification = ToBeClassified;
        }
        field(4; "Search Description"; Text[100])
        {
            Caption = 'Search Description';
            DataClassification = ToBeClassified;
        }
        field(5; "Automatic Ext. Texts"; Boolean)
        {
            Caption = 'Automatic Ext. Texts';
            DataClassification = ToBeClassified;
        }
        field(6; "Basic Unit of Meassure"; Code[10])
        {
            Caption = 'Basic Unit of Meassure';
            TableRelation = "Unit of Measure".Code;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                CRMUOMGroup: Record "CRM Uomschedule";
                CRMUOM: Record "CRM Uom";
            begin
                CRMUOMGroup.Reset();
                CRMUOMGroup.SetRange(BaseUoMName, "Basic Unit of Meassure");
                if CRMUOMGroup.FindFirst() then begin
                    "UOM Group" := CRMUOMGroup.Name;
                end;
                CRMUOM.Reset();
                CRMUOM.SetRange(BaseUoMName, "Basic Unit of Meassure");
                if CRMUOM.FindFirst() then begin
                    "UOM ID" := CRMUOM.BaseUoM;
                end;
                CRMUOMGroup.Reset();
                CRMUOMGroup.SetRange(BaseUoMName, "Basic Unit of Meassure");
                if CRMUOMGroup.FindFirst() then begin
                    "UOM Group ID" := CRMUOMGroup.UoMScheduleId;
                end;

            end;
        }
        field(7; OEM; Code[20])
        {
            Caption = 'OEM';
            TableRelation = oem.Code where("OEM Type" = filter(Equipment));
            DataClassification = ToBeClassified;
        }
        field(8; EAN; Text[80])
        {
            Caption = 'EAN';
            DataClassification = ToBeClassified;
        }
        field(9; GTIN; Code[14])
        {
            Caption = 'GTIN';
            DataClassification = ToBeClassified;
        }
        field(10; "Net Weight"; Decimal)
        {
            Caption = 'Net Weight';
            DataClassification = ToBeClassified;
        }
        field(11; "Gross Weight"; Decimal)
        {
            Caption = 'Gross Weight';
            DataClassification = ToBeClassified;
        }
        field(12; "Unit Volume"; Decimal)
        {
            Caption = 'Unit Volume';
            DataClassification = ToBeClassified;
        }
        field(13; "No. of Images"; Integer)
        {
            Caption = 'No. of Images';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(14; "Tariff No."; Code[20])
        {
            Caption = 'Tariff No.';
            TableRelation = "Tariff Number"."No.";
            DataClassification = ToBeClassified;
        }
        field(15; "Import Tariff Code"; Text[20])
        {
            Caption = 'Import Tariff Code';
            DataClassification = ToBeClassified;
        }
        field(16; "Export Tariff Code"; Text[20])
        {
            Caption = 'Export Tariff Code';
            DataClassification = ToBeClassified;
        }
        field(17; "Available New"; Boolean)
        {
            Caption = 'Available New';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Available New" then
                    Rec.NewItemCreation(Rec);
            end;
        }
        field(18; "Available Refurbished"; Boolean)
        {
            Caption = 'Available Refurbished';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                if "Available Refurbished" then
                    Rec.RefurbishedItemCreation(Rec);
            end;
        }
        field(19; "Available Used"; Boolean)
        {
            Caption = 'Available Used';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                if "Available Used" then
                    Rec.UsedItemCreation(Rec);
            end;
        }
        field(20; "Available Repaired"; Boolean)
        {
            Caption = 'Available Repaired';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var

            begin

            end;
        }
        field(21; "New Item"; Code[20])
        {
            Caption = 'New Item';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Item."No." where("Parent Item" = field("No."), Condition = filter(new), Description = field(Description)));
        }
        field(22; "Refurbished Item"; Code[20])
        {
            Caption = 'Refurbished Item';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Item."No." where("Parent Item" = field("No."), Condition = filter(Refurbished), Description = field(Description)));
        }
        field(23; "Used Item"; Code[20])
        {
            Caption = 'Used Item';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Item."No." where("Parent Item" = field("No."), Condition = filter(Used), Description = field(Description)));
        }
        field(24; "Repaired Item"; Code[20])
        {
            Caption = 'Repaired Item';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Item."No." where("Parent Item" = field("No."), Condition = filter(Repaired), Description = field(Description)));
        }
        field(25; "Without Special Character"; Text[65])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Lower Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Parent Item"; Guid)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
        }
        field(31; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(32; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(33; "UOM ID"; Guid)
        {
            Caption = 'UOM ID';

        }


        field(34; "Life Stage"; Enum "Life Stage")
        {
            DataClassification = ToBeClassified;

        }
        field(35; Salmasid; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36; iddeladd; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(37; magentoid; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "UOM Group"; Code[200])
        {
            Caption = 'UOM Group';

        }
        field(39; "New Open Box Item"; Code[20])
        {
            Caption = 'New Open Box Item';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Item."No." where("Parent Item" = field("No."), Condition = filter("New Open Box"), Description = field(Description)));
        }
        field(40; "Available New Open Box"; Boolean)
        {
            Caption = 'Available New Open Box';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
            begin
                if "Available New Open Box" then
                    Rec.OpenBoxItemCreation(Rec);
            end;
        }
        field(41; "Country/Region of Origin Code"; Code[10])
        {
            Caption = 'Country/Region of Origin Code';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region".Code;
            // trigger OnValidate()
            // var
            //     CDSCountry : Record "CRM Country";
            // begin
            //     CDSCountry.Reset();
            //     CDSCountry.SetRange();
            // end;
        }
        field(42; "UOM Group ID"; Guid)
        {
            Caption = 'UOM Group ID';
        }
        field(43; "Serial Nos."; Code[20])
        {
            Caption = 'Serial Nos.';
            TableRelation = "No. Series";

            trigger OnValidate()
            begin
                if "Serial Nos." <> '' then
                    TestField("Item Tracking Code");
            end;
        }

        field(44; "Item Tracking Code"; Code[10])
        {
            Caption = 'Item Tracking Code';
            TableRelation = "Item Tracking Code";

        }
        field(45; "Part Code"; Code[50])
        {
            Caption = 'Part Code';

            trigger onvalidate()
            var
                ParenteItem: Record "Parent Items";
            begin
                ParenteItem.Reset();
                ParenteItem.SetFilter("No.", '<>%1', Rec."No.");
                ParenteItem.SetRange("Part Code", Rec."Part Code");
                if ParenteItem.FindFirst() then begin
                    Error(Descrierror);
                end;
                ParenteItem.Reset();
                ParenteItem.SetFilter("No.", '<>%1', Rec."No.");
                if ParenteItem.FindFirst() then begin
                    repeat
                        if (DelChr(Rec."Part Code", '=', SpecialCharavar)) = (DelChr(ParenteItem."Part Code", '=', SpecialCharavar)) then
                            Error(Descrierror);
                    until ParenteItem.Next() = 0;
                end;
            end;
        }
    }
    keys
    {
        key(PK; Description)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Parent Item" := SystemId;
    end;

    procedure NewItemCreation(Rec: Record "Parent Items")
    Var
        ItemRec: Record Item;
    begin

        ItemRec.Init();
        ItemRec.Validate("No.", Rec."No." + '-N');
        ItemRec.Validate(Description, Rec.Description);
        ItemRec.validate("Description 2", Rec."Description 2");
        ItemRec.Validate("Search Description", Rec."Search Description");
        ItemRec.Validate("Part Code", Rec."Part Code");
        ItemRec.Validate("Parent Item", Rec."No.");
        ItemRec.Validate(Condition, ItemRec.Condition::New);
        //ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
        ItemRec.Validate("Parent Item Id", Rec."Parent Item");
        ItemRec.Validate("Part/Components", ItemRec."Part/Components"::Part);
        ItemRec.Validate("CRM Id", CreateGuid());
        ItemRec.Validate("OEM Code", Rec.OEM);
        ItemRec.Validate(EAN, Rec.EAN);
        ItemRec.validate("Tariff No.", Rec."Tariff No.");
        ItemRec.validate("Impot Tariff Code", Rec."Import Tariff Code");
        ItemRec.validate("Export Tariff Code", Rec."Export Tariff Code");
        ItemRec.Validate("Automatic Ext. Texts", Rec."Automatic Ext. Texts");
        ItemRec.Validate("Unit Volume", Rec."Unit Volume");
        ItemRec.Validate("Net Weight", Rec."Net Weight");
        ItemRec.Validate("Gross Weight", Rec."Gross Weight");
        ItemRec.Validate(GTIN, Rec.GTIN);
        ItemRec.validate("Gen. Prod. Posting Group", Rec."Gen. Prod. Posting Group");
        ItemRec.validate("VAT Prod. Posting Group", Rec."VAT Prod. Posting Group");
        ItemRec.validate("Inventory Posting Group", Rec."Inventory Posting Group");
        ItemRec.Validate("Replenishment System", ItemRec."Replenishment System"::Purchase);
        ItemRec.validate(Salmasid, Rec.Salmasid);
        ItemRec.validate(MagentoID, Rec.MagentoID);
        ItemRec.Validate(iddeladd, Rec.iddeladd);
        ItemRec.Validate("Life Stage", Rec."Life Stage");
        ItemRec.validate("Country/Region of Origin Code", Rec."Country/Region of Origin Code");
        ItemRec.Validate(Type, ItemRec.Type::Inventory);
        ItemRec.validate("Item Tracking Code", Rec."Item Tracking Code");
        ItemRec.validate("Serial Nos.", Rec."Serial Nos.");
        ItemRec.Insert();
        ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
        ItemRec.Modify();
    end;

    procedure RefurbishedItemCreation(Rec: Record "Parent Items")
    var
        Itemrec: Record Item;
    begin
        ItemRec.Init();
        ItemRec.Validate("No.", Rec."No." + '-RF');
        ItemRec.Validate(Description, Rec.Description);
        ItemRec.validate("Description 2", Rec."Description 2");
        ItemRec.Validate("Search Description", Rec."Search Description");
        Itemrec.Validate("Part Code", Rec."Part Code");
        ItemRec.Validate("Parent Item", Rec."No.");
        ItemRec.Validate(Condition, ItemRec.Condition::"Refurbished");
        ItemRec.Validate("Parent Item Id", Rec."Parent Item");
        ItemRec.Validate("Part/Components", ItemRec."Part/Components"::Part);
        ItemRec.Validate("CRM Id", CreateGuid());
        ItemRec.Validate("OEM Code", Rec.OEM);
        ItemRec.Validate(EAN, Rec.EAN);
        ItemRec.validate("Tariff No.", Rec."Tariff No.");
        ItemRec.validate("Impot Tariff Code", Rec."Import Tariff Code");
        ItemRec.validate("Export Tariff Code", Rec."Export Tariff Code");
        ItemRec.Validate("Automatic Ext. Texts", Rec."Automatic Ext. Texts");
        ItemRec.Validate("Unit Volume", Rec."Unit Volume");
        ItemRec.Validate("Net Weight", Rec."Net Weight");
        ItemRec.Validate("Gross Weight", Rec."Gross Weight");
        ItemRec.Validate(GTIN, Rec.GTIN);
        ItemRec.validate("Gen. Prod. Posting Group", Rec."Gen. Prod. Posting Group");
        ItemRec.validate("VAT Prod. Posting Group", Rec."VAT Prod. Posting Group");
        ItemRec.validate("Inventory Posting Group", Rec."Inventory Posting Group");
        ItemRec.Validate("Replenishment System", ItemRec."Replenishment System"::"Prod. Order");
        ItemRec.validate(Salmasid, Rec.Salmasid);
        ItemRec.validate(MagentoID, Rec.MagentoID);
        ItemRec.Validate(iddeladd, Rec.iddeladd);
        ItemRec.Validate("Life Stage", Rec."Life Stage");
        ItemRec.validate("Country/Region of Origin Code", Rec."Country/Region of Origin Code");
        ItemRec.Validate(Type, ItemRec.Type::Inventory);
        ItemRec.validate("Item Tracking Code", Rec."Item Tracking Code");
        ItemRec.validate("Serial Nos.", Rec."Serial Nos.");
        ItemRec.Insert();
        ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
        ItemRec.Modify();
    end;

    procedure UsedItemCreation(Rec: Record "Parent Items")
    var
        Itemrec: Record Item;
    begin
        ItemRec.Init();
        ItemRec.Validate("No.", Rec."No." + '-U');
        ItemRec.Validate(Description, Rec.Description);
        ItemRec.validate("Description 2", Rec."Description 2");
        ItemRec.Validate("Search Description", Rec."Search Description");
        Itemrec.Validate("Part Code", Rec."Part Code");
        ItemRec.Validate("Parent Item", Rec."No.");
        ItemRec.Validate(Condition, ItemRec.Condition::Used);
        //ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
        ItemRec.Validate("Parent Item Id", Rec."Parent Item");
        ItemRec.Validate("Part/Components", ItemRec."Part/Components"::Part);
        ItemRec.Validate("CRM Id", CreateGuid());
        ItemRec.Validate("OEM Code", Rec.OEM);
        ItemRec.Validate(EAN, Rec.EAN);
        ItemRec.validate("Tariff No.", Rec."Tariff No.");
        ItemRec.validate("Impot Tariff Code", Rec."Import Tariff Code");
        ItemRec.validate("Export Tariff Code", Rec."Export Tariff Code");
        ItemRec.Validate("Automatic Ext. Texts", Rec."Automatic Ext. Texts");
        ItemRec.Validate("Unit Volume", Rec."Unit Volume");
        ItemRec.Validate("Net Weight", Rec."Net Weight");
        ItemRec.Validate("Gross Weight", Rec."Gross Weight");
        ItemRec.validate("Gen. Prod. Posting Group", Rec."Gen. Prod. Posting Group");
        ItemRec.validate("VAT Prod. Posting Group", Rec."VAT Prod. Posting Group");
        ItemRec.validate("Inventory Posting Group", Rec."Inventory Posting Group");
        ItemRec.Validate(GTIN, Rec.GTIN);
        ItemRec.Validate("Replenishment System", ItemRec."Replenishment System"::Purchase);
        ItemRec.validate(Salmasid, Rec.Salmasid);
        ItemRec.validate(MagentoID, Rec.MagentoID);
        ItemRec.Validate(iddeladd, Rec.iddeladd);
        ItemRec.Validate("Life Stage", Rec."Life Stage");
        ItemRec.validate("Country/Region of Origin Code", Rec."Country/Region of Origin Code");
        ItemRec.Validate(Type, ItemRec.Type::Inventory);
        ItemRec.validate("Item Tracking Code", Rec."Item Tracking Code");
        ItemRec.validate("Serial Nos.", Rec."Serial Nos.");
        ItemRec.Insert();
        ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
        ItemRec.Modify();
    end;

    procedure OpenBoxItemCreation(Rec: Record "Parent Items")
    var
        Itemrec: Record Item;
    begin
        ItemRec.Init();
        ItemRec.Validate("No.", Rec."No." + '-OB');
        ItemRec.Validate(Description, Rec.Description);
        ItemRec.validate("Description 2", Rec."Description 2");
        ItemRec.Validate("Search Description", Rec."Search Description");
        Itemrec.Validate("Part Code", Rec."Part Code");
        ItemRec.Validate("Parent Item", Rec."No.");
        ItemRec.Validate(Condition, ItemRec.Condition::"New Open Box");
        // ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
        ItemRec.Validate("Parent Item Id", Rec."Parent Item");
        ItemRec.Validate("Part/Components", ItemRec."Part/Components"::Part);
        ItemRec.Validate("CRM Id", CreateGuid());
        ItemRec.Validate("OEM Code", Rec.OEM);
        ItemRec.Validate(EAN, Rec.EAN);
        ItemRec.validate("Tariff No.", Rec."Tariff No.");
        ItemRec.validate("Impot Tariff Code", Rec."Import Tariff Code");
        ItemRec.validate("Export Tariff Code", Rec."Export Tariff Code");
        ItemRec.Validate("Automatic Ext. Texts", Rec."Automatic Ext. Texts");
        ItemRec.Validate("Unit Volume", Rec."Unit Volume");
        ItemRec.Validate("Net Weight", Rec."Net Weight");
        ItemRec.Validate("Gross Weight", Rec."Gross Weight");
        ItemRec.validate("Gen. Prod. Posting Group", Rec."Gen. Prod. Posting Group");
        ItemRec.validate("VAT Prod. Posting Group", Rec."VAT Prod. Posting Group");
        ItemRec.validate("Inventory Posting Group", Rec."Inventory Posting Group");
        ItemRec.Validate(GTIN, Rec.GTIN);
        ItemRec.Validate("Replenishment System", ItemRec."Replenishment System"::Purchase);
        ItemRec.validate(Salmasid, Rec.Salmasid);
        ItemRec.validate(MagentoID, Rec.MagentoID);
        ItemRec.Validate(iddeladd, Rec.iddeladd);
        ItemRec.Validate("Life Stage", Rec."Life Stage");
        ItemRec.validate("Country/Region of Origin Code", Rec."Country/Region of Origin Code");
        ItemRec.Validate(Type, ItemRec.Type::Inventory);
        ItemRec.validate("Item Tracking Code", Rec."Item Tracking Code");
        ItemRec.validate("Serial Nos.", Rec."Serial Nos.");
        ItemRec.Insert();
        ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
        ItemRec.Modify();
    end;

    var
        Descrierror: Label 'Part Number %1 is already exist.';
        ParentItemRec: Record "Parent Items";
        SpecialCharavar: Label ' |~|`|!|@|#|$|%|^|&|*|(|)|_|-|?|/|\|{|}|[|]|<|>|,|.|;|:|"|';
}