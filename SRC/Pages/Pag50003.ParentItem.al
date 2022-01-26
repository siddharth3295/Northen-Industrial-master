page 50003 "Parent Item"
{

    Caption = 'Parent Item';
    PageType = Card;
    SourceTable = "Parent Items";

    layout
    {
        area(content)
        {
            group(General)
            {

                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var

                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var

                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies the value of the Description 2 field.';
                    ApplicationArea = All;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ToolTip = 'Specifies the value of the Search Description field.';
                    ApplicationArea = All;
                }
                field("Part Code"; Rec."Part Code")
                {
                    ToolTip = 'Specifies the value of the Part Code field.';
                    ApplicationArea = All;
                }
                field("Country/Region of Origin Code"; Rec."Country/Region of Origin Code")
                {
                    ToolTip = 'Specifies the value of the Available New Open Box field.';
                    ApplicationArea = All;
                }
                field("Basic Unit of Meassure"; Rec."Basic Unit of Meassure")
                {
                    ToolTip = 'Specifies the value of the Basic Unit of Meassure field.';
                    ApplicationArea = All;
                    ShowMandatory = true;

                    trigger OnValidate()
                    var
                        CRMUOM: Record "CRM Uom";
                    begin
                        CRMUOM.Reset();
                        CRMUOM.SetRange(Name, Rec."Basic Unit of Meassure");
                        if CRMUOM.FindFirst() then begin
                            Rec."UOM ID" := CRMUOM.UoMId;
                        end
                    end;
                }
                field("UOM Group"; Rec."UOM Group")
                {
                    ToolTip = 'Specifies the value of the UOM Group field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Salmasid; Rec.Salmasid)
                {
                    ToolTip = 'Specifies the value of the Salmasid field.';
                    ApplicationArea = All;
                }
                field(magentoid; Rec.magentoid)
                {
                    ToolTip = 'Specifies the value of the magentoid field.';
                    ApplicationArea = All;
                }
                field("Life Stage"; Rec."Life Stage")
                {
                    ToolTip = 'Specifies the value of the Life Stage field.';
                    ApplicationArea = All;
                }

                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ToolTip = 'Specifies the value of the Inventory Posting Group field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }

                field(OEM; Rec.OEM)
                {
                    ToolTip = 'Specifies the value of the OEM field.';
                    ApplicationArea = All;
                }
                field(EAN; Rec.EAN)
                {
                    ToolTip = 'Specifies the value of the EAN field.';
                    ApplicationArea = All;
                }
                field("Automatic Ext. Texts"; Rec."Automatic Ext. Texts")
                {
                    ToolTip = 'Specifies the value of the Automatic Ext. Texts field.';
                    ApplicationArea = All;
                }
                field(GTIN; Rec.GTIN)
                {
                    ToolTip = 'Specifies the value of the GTIN field.';
                    ApplicationArea = All;
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ToolTip = 'Specifies the value of the Net Weight field.';
                    ApplicationArea = All;
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ToolTip = 'Specifies the value of the Gross Weight field.';
                    ApplicationArea = All;
                }
                field("Unit Volume"; Rec."Unit Volume")
                {
                    ToolTip = 'Specifies the value of the Unit Volume field.';
                    ApplicationArea = All;
                }
                field("No. of Images"; Rec."No. of Images")
                {
                    ToolTip = 'Specifies the value of the No. of Images field.';
                    ApplicationArea = All;
                }
                field("Item Tracking Code"; Rec."Item Tracking Code")
                {
                    ToolTip = 'Specifies the value of the Item Tracking Code field.';
                    ApplicationArea = All;
                }
                field("Serial Nos."; Rec."Serial Nos.")
                {
                    ToolTip = 'Specifies the value of the Serial Nos. field.';
                    ApplicationArea = All;
                }
            }
            group("Costs & Posting")
            {
                group("Foreign Trade")
                {

                    field("Tariff No."; Rec."Tariff No.")
                    {
                        ToolTip = 'Specifies the value of the Tariff No. field.';
                        ApplicationArea = All;
                    }
                    field("Import Tariff Code"; Rec."Import Tariff Code")
                    {
                        ToolTip = 'Specifies the value of the Import Tariff Code field.';
                        ApplicationArea = All;
                    }
                    field("Export Tariff Code"; Rec."Export Tariff Code")
                    {
                        ToolTip = 'Specifies the value of the Export Tariff Code field.';
                        ApplicationArea = All;
                    }
                }
            }
            group("Conditions")
            {
                group(Available)
                {
                    field("Available New"; Rec."Available New")
                    {
                        ToolTip = 'Specifies the value of the Available New field.';
                        ApplicationArea = All;
                        Editable = NewEdit;
                        trigger OnValidate()
                        var
                            ItemRec: Record Item;
                        begin
                            if Rec."Available New" then
                                NewEdit := false;
                            // else
                            //     NewEdit := true;
                            // if Rec."Available New" then begin
                            //     Rec.NewItemCreation(ItemRec, Rec);
                            // end;
                            CurrPage.Update(true);
                        end;
                    }
                    field("Available Refurbished"; Rec."Available Refurbished")
                    {
                        ToolTip = 'Specifies the value of the Available Refurbished field.';
                        ApplicationArea = All;
                        Editable = RFEdit;
                        trigger OnValidate()
                        var
                            ItemRec: Record Item;
                        begin
                            if Rec."Available Refurbished" then
                                RFEdit := false;
                            // else
                            //     RFEdit := true;
                            // if Rec."Available Refurbished" then begin
                            //     Rec.RefurbishedItemCreation(ItemRec, Rec);
                            // end;
                            CurrPage.Update(true);
                        end;
                    }
                    field("Available Used"; Rec."Available Used")
                    {
                        ToolTip = 'Specifies the value of the Available Used field.';
                        ApplicationArea = All;
                        Editable = UsedEdit;
                        trigger OnValidate()
                        var
                            ItemRec: Record Item;
                        begin
                            if Rec."Available Used" then
                                UsedEdit := false;
                            // else
                            //     UsedEdit := true;
                            // if Rec."Available Used" then begin
                            //     Rec.UsedItemCreation(ItemRec, Rec);
                            // end;
                            CurrPage.Update(true);
                        end;
                    }
                    // field("Available Repaired"; Rec."Available Repaired")
                    // {
                    //     ToolTip = 'Specifies the value of the Available Repaired field.';
                    //     ApplicationArea = All;
                    // }

                    field("Available New Open Box"; Rec."Available New Open Box")
                    {
                        ToolTip = 'Specifies the value of the Available New Open Box field.';
                        ApplicationArea = All;
                        Editable = OpenBoxEdit;
                        trigger OnValidate()
                        var
                            ItemRec: Record Item;
                        begin
                            if Rec."Available New Open Box" then
                                OpenBoxEdit := false;
                            // else
                            //     UsedEdit := true;
                            // if Rec."Available New Open Box" then begin
                            //     Rec.OpenBoxItemCreation(ItemRec, Rec);
                            // end;
                            CurrPage.Update(true);
                        end;
                    }
                }
                group(Items)
                {
                    field("New Item"; Rec."New Item")
                    {
                        ToolTip = 'Specifies the value of the New Item field.';
                        ApplicationArea = All;
                    }
                    field("Refurbished Item"; Rec."Refurbished Item")
                    {
                        ToolTip = 'Specifies the value of the Refurbished Item field.';
                        ApplicationArea = All;
                    }
                    field("Used Item"; Rec."Used Item")
                    {
                        ToolTip = 'Specifies the value of the Used Item field.';
                        ApplicationArea = All;
                    }
                    // field("Repaired Item"; Rec."Repaired Item")
                    // {
                    //     ToolTip = 'Specifies the value of the Repaired Item field.';
                    //     ApplicationArea = All;
                    // }
                    field("New Open Box Item"; Rec."New Open Box Item")
                    {
                        ToolTip = 'Specifies the value of the New Open Box Item Item field.';
                        ApplicationArea = All;
                    }
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Setup Coupling")
            {
                Caption = 'Set Up Coupling';
                ApplicationArea = All;
                Visible = true;
                Image = LinkAccount;
                ToolTip = 'Create or modify the coupling to a Common Data Service Price Category.';

                trigger OnAction();
                var
                    CRMIntegrationManagement1: Codeunit "CRM Integration Management";
                    ParentItems: Record "Parent Items";
                begin

                    if ParentItems.Get(Rec.Description) then
                        CRMIntegrationManagement1.DefineCoupling(ParentItems.RecordId);
                end;
            }

            action("Delete Coupling")
            {
                Caption = 'Delete Coupling';
                ApplicationArea = All;
                Visible = true;
                Image = UnLinkAccount;
                Enabled = CDSIsCoupledToRecord;
                ToolTip = 'Delete the coupling to a Common Data Service Price Category.';

                trigger OnAction();
                var
                    CRMCouplingManagement1: Codeunit "CRM Coupling Management";
                begin
                    CRMCouplingManagement1.RemoveCoupling(Rec.RecordId);
                end;
            }
            action("Show Log")
            {
                Caption = 'Synchronization Log';
                ApplicationArea = All;
                Visible = true;
                Image = Log;
                ToolTip = 'View integration synchronization jobs for the Price Category table.';

                trigger OnAction();
                var
                    CRMIntegrationManagement1: Codeunit "CRM Integration Management";
                begin
                    CRMIntegrationManagement1.ShowLog(Rec.RecordId);
                end;
            }
        }
    }





    trigger OnOpenPage()
    begin
        CDSIntegrationEnabled := CRMIntegrationManagement.IsCDSIntegrationEnabled();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if CDSIntegrationEnabled then CDSIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec."Available New" = false then
            NewEdit := true
        else
            NewEdit := false;
        if rec."Available Refurbished" = false then
            RFEdit := true
        else
            RFEdit := false;
        if Rec."Available Used" = false then
            UsedEdit := true
        else
            UsedEdit := false;
        if Rec."Available New Open Box" = false then
            OpenBoxEdit := true
        else
            OpenBoxEdit := false;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec."Available New" = false then
            NewEdit := true
        else
            NewEdit := false;
        if Rec."Available Refurbished" = false then
            RFEdit := true
        else
            RFEdit := false;
        if Rec."Available Used" = false then
            UsedEdit := true
        else
            UsedEdit := false;
        if Rec."Available New Open Box" = false then
            OpenBoxEdit := true
        else
            OpenBoxEdit := false;
    end;

    var
        UsedEdit: Boolean;
        RFEdit: Boolean;
        NewEdit: Boolean;
        OpenBoxEdit: Boolean;
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        CDSIntegrationEnabled: Boolean;
        CDSIsCoupledToRecord: Boolean;
}