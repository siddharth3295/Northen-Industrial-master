codeunit 50004 EventMgmt
{
    var

    [EventSubscriber(ObjectType::Table, Database::"Parent Items", 'OnBeforeDeleteEvent', '', false, false)]
    local procedure DeleteParentItem(var Rec: Record "Parent Items")
    var
        Item: Record Item;
        ILE: Record "Item Ledger Entry";

    begin
        Rec.CalcFields("New Item");
        Rec.CalcFields("Refurbished Item");
        Rec.CalcFields("Used Item");
        Rec.CalcFields("New Open Box Item");
        NewItemDelete(Rec."New Item");
        RefurbishedItemDelete(Rec."Refurbished Item");
        UsedItemDelete(Rec."Used Item");
        OpenBoxItemDelete(Rec."New Open Box Item");
    end;


    procedure NewItemDelete(ChildItem: Code[20])
    var
        Item: Record Item;
        ILE: Record "Item Ledger Entry";
    begin
        if Item.Get(ChildItem) then begin
            ILE.Reset();
            ILE.SetRange("Item No.", item."No.");
            if not ILE.FindSet() then begin
                Item.Delete(false);
            end else
                Error('This Item has Item Ledger Entries, you cannot delete these item.')
        end;
    end;

    procedure RefurbishedItemDelete(ChildItem: Code[20])
    var
        Item: Record Item;
        ILE: Record "Item Ledger Entry";
    begin
        if Item.Get(ChildItem) then begin
            ILE.Reset();
            ILE.SetRange("Item No.", item."No.");
            if not ILE.FindSet() then begin
                Item.Delete(false);
            end
            else
                Error('This Item has Item Ledger Entries, you cannot delete these item.')
        end;
    end;

    procedure UsedItemDelete(ChildItem: Code[20])
    var
        Item: Record Item;
        ILE: Record "Item Ledger Entry";
    begin
        if Item.Get(ChildItem) then begin
            ILE.Reset();
            ILE.SetRange("Item No.", item."No.");
            if not ILE.FindSet() then begin
                Item.Delete(false);
            end else
                Error('This Item has Item Ledger Entries, you cannot delete these item.')
        end;
    end;

    procedure OpenBoxItemDelete(ChildItem: Code[20])
    var
        Item: Record Item;
        ILE: Record "Item Ledger Entry";
    begin
        if Item.Get(ChildItem) then begin
            ILE.Reset();
            ILE.SetRange("Item No.", item."No.");
            if not ILE.FindSet() then begin
                Item.Delete(false);
            end else
                Error('This Item has Item Ledger Entries, you cannot delete these item.')
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Parent Items", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyEvent(var Rec: Record "Parent Items")
    var
        Item: Record Item;
    begin
        Rec.CalcFields("New Item");
        Rec.CalcFields("Refurbished Item");
        Rec.CalcFields("Used Item");
        Rec.CalcFields("New Open Box Item");
        // Item.Reset();
        // Item.SetRange("No.",);
        if Item.Get(Rec."New Item") then
            ModifyNewItemCreation(Item."No.", Rec);
        if Item.Get(Rec."Refurbished Item") then
            ModifyRefurbishedItemCreation(Item."No.", Rec);
        if Item.Get(Rec."Used Item") then
            ModifyUsedItemCreation(Item."No.", Rec);
        if Item.Get(Rec."New Open Box Item") then
            ModifyOpenBoxItemCreation(Item."No.", Rec);
    end;

    procedure ModifyNewItemCreation(No: Code[20]; Rec: Record "Parent Items")
    var
        Itemrec: Record Item;
    begin
        // Rec.CalcFields("New Item");
        if ItemRec.Get(No) then begin
            // ItemRec.Init();
            // ItemRec.Validate("No.", Rec."No." + '-N');
            // ItemRec.Validate(Description, Rec.Description);
            ItemRec.validate("Description 2", Rec."Description 2");
            ItemRec.Validate("Search Description", Rec."Search Description");
            ItemRec.Validate("Parent Item", Rec."No.");
            ItemRec.Validate(Condition, ItemRec.Condition::New);
            //ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
            Itemrec.Validate("Part Code", Rec."Part Code");
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

            ItemRec.validate("Item Tracking Code", Rec."Item Tracking Code");
            ItemRec.validate("Serial Nos.", Rec."Serial Nos.");
            // ItemRec.Insert();
            // ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
            ItemRec.Modify(false);
        end;
    end;

    procedure ModifyRefurbishedItemCreation(No: Code[20]; Rec: Record "Parent Items")
    var
        Itemrec: Record Item;
    begin
        // Rec.CalcFields("Refurbished Item");
        if ItemRec.Get(No) then begin
            // ItemRec.Init();
            // ItemRec.Validate("No.", Rec."No." + '-RF');
            // ItemRec.Validate(Description, Rec.Description);
            ItemRec.validate("Description 2", Rec."Description 2");
            ItemRec.Validate("Search Description", Rec."Search Description");
            ItemRec.Validate("Parent Item", Rec."No.");
            ItemRec.Validate(Condition, ItemRec.Condition::"Refurbished");
            Itemrec.Validate("Part Code", Rec."Part Code");

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

            ItemRec.validate("Item Tracking Code", Rec."Item Tracking Code");
            ItemRec.validate("Serial Nos.", Rec."Serial Nos.");
            // ItemRec.Insert();
            // ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
            ItemRec.Modify(false);
        end;
    end;

    procedure ModifyUsedItemCreation(No: Code[20]; Rec: Record "Parent Items")
    var
        Itemrec: Record Item;
    begin
        // Rec.CalcFields("Used Item");
        if ItemRec.Get(No) then begin
            // ItemRec.Init();
            // ItemRec.Validate("No.", Rec."No." + '-U');
            // ItemRec.Validate(Description, Rec.Description);
            ItemRec.validate("Description 2", Rec."Description 2");
            ItemRec.Validate("Search Description", Rec."Search Description");
            ItemRec.Validate("Parent Item", Rec."No.");
            ItemRec.Validate(Condition, ItemRec.Condition::Used);
            Itemrec.Validate("Part Code", Rec."Part Code");
            //ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");

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

            ItemRec.validate("Item Tracking Code", Rec."Item Tracking Code");
            ItemRec.validate("Serial Nos.", Rec."Serial Nos.");

            // ItemRec.Insert();
            // ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
            ItemRec.Modify(false);
        end;
    end;

    procedure ModifyOpenBoxItemCreation(No: Code[20]; Rec: Record "Parent Items")
    var
        Itemrec: Record Item;
    begin
        // Rec.CalcFields("New Open Box Item");
        if ItemRec.Get(No) then begin
            // ItemRec.Init();
            // ItemRec.Validate("No.", Rec."No." + '-OB');
            // ItemRec.Validate(Description, Rec.Description);
            ItemRec.validate("Description 2", Rec."Description 2");
            ItemRec.Validate("Search Description", Rec."Search Description");
            ItemRec.Validate("Parent Item", Rec."No.");
            ItemRec.Validate(Condition, ItemRec.Condition::"New Open Box");
            // ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
            ItemRec.Validate("OEM Code", Rec.OEM);
            ItemRec.Validate(EAN, Rec.EAN);
            Itemrec.Validate("Part Code", Rec."Part Code");
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

            ItemRec.validate("Item Tracking Code", Rec."Item Tracking Code");
            ItemRec.validate("Serial Nos.", Rec."Serial Nos.");
            // ItemRec.Insert();
            // ItemRec.Validate("Base Unit of Measure", Rec."Basic Unit of Meassure");
            ItemRec.Modify(false);
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Item, 'OnAfterValidateEvent', 'Type', false, false)]
    local procedure UpdateTypeasInteger(var Rec: Record Item)
    begin
        if Rec.Type = Rec.Type::Inventory then
            Rec."Type as Integer" := Rec."Type as Integer"::Inventory;
        if Rec.Type = Rec.Type::"Non-Inventory" then
            Rec."Type as Integer" := Rec."Type as Integer"::"Non-Inventory";
        if Rec.Type = Rec.Type::Service then
            Rec."Type as Integer" := Rec."Type as Integer"::Service;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterValidateEvent', 'Item No.', false, false)]
    local procedure PartCodeItemJournal(var Rec: Record "Item Journal Line"; var xRec: Record "Item Journal Line");
    var
        Item: Record Item;
    begin
        xRec."Part Code" := '';
        if Item.get(Rec."Item No.") then
            Rec."Part Code" := Item."Part Code";

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure PartCodeItemSalesLines(var Rec: Record "Sales Line"; var xRec: Record "Sales Line");
    var
        Item: Record Item;
    begin
        xRec."Part Code" := '';
        if Item.get(Rec."No.") then
            Rec."Part Code" := Item."Part Code";

    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure PartCodeItemPurchaseLines(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line");
    var
        Item: Record Item;
    begin
        xRec."Part Code" := '';
        if Item.get(Rec."No.") then
            Rec."Part Code" := Item."Part Code";

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', False, false)]
    local procedure OnBeforeInsertItemLedgEntryPartCode(ItemJournalLine: Record "Item Journal Line"; var ItemLedgerEntry: Record "Item Ledger Entry")
    var
        Item: Record Item;
    begin
        if Item.Get(ItemJournalLine."Item No.") then
            ItemLedgerEntry."Part Code" := Item."Part Code";
    end;
}
