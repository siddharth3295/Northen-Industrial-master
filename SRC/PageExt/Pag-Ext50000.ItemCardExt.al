pageextension 50000 "Item Card Ext" extends "Item Card"
{
    layout
    {
        modify("Search Description")
        {
            Editable = EditFalse;
        }
        modify(Description)
        {
            Editable = EditFalse;
        }
        modify("Qty. on Prod. Order")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Qty. on Component Lines")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Qty. on Service Order")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Net Weight")
        {
            Editable = EditFalse;
        }
        modify("Gross Weight")
        {
            Editable = EditFalse;
        }
        modify("Unit Volume")
        {
            Editable = EditFalse;
        }
        modify("Tariff No.")
        {
            Editable = EditFalse;
        }
        modify("Manufacturing Policy")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Routing No.")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Production BOM No.")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Rounding Precision")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Flushing Method")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Overhead Rate")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Scrap %")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Lot Size")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Service Item Group")
        {
            Visible = true;
            ApplicationArea = all;
        }
        modify("Automatic Ext. Texts")
        {
            Editable = EditFalse;
        }
        moveafter("Item Category Code"; "Service Item Group")

        addafter(Description)
        {
            field(Salmasid; Rec.Salmasid)
            {
                ToolTip = 'Specifies the value of the Salmasid field.';
                ApplicationArea = All;
                Editable = EditFalse;
            }
            field("Part Code"; Rec."Part Code")
            {
                ToolTip = 'Specifies the value of the Part Code field.';
                ApplicationArea = All;
                Editable = EditFalse;
            }
            field(iddeladd; Rec.iddeladd)
            {
                ToolTip = 'Specifies the value of the iddeladd field.';
                ApplicationArea = All;
                Editable = EditFalse;
            }

            field(magentoid; Rec.magentoid)
            {
                ToolTip = 'Specifies the value of the magentoid field.';
                ApplicationArea = All;
                Editable = EditFalse;
            }
            field("Description 2"; Rec."Description 2")
            {
                Editable = EditFalse;
                ToolTip = 'Specifies the value of the Description 2 field.';
                ApplicationArea = All;
            }
            field("Life Stage"; Rec."Life Stage")
            {
                ToolTip = 'Specifies the value of the Life Stage field.';
                ApplicationArea = All;
                Editable = EditFalse;
            }
            field(Condition; Rec.Condition)
            {
                ToolTip = 'Specifies the value of the Condition field.';
                ApplicationArea = All;
                Editable = EditFalse;
            }
            field("OEM Code"; Rec."OEM Code")
            {
                ToolTip = 'Specifies the value of the OEM field.';
                ApplicationArea = All;
                Editable = EditFalse;
            }
            field(EAN; Rec.EAN)
            {
                ToolTip = 'Specifies the value of the EAN field.';
                ApplicationArea = All;
            }
            field("Parent Item"; Rec."Parent Item")
            {
                ToolTip = 'Specifies the value of the Parent Item field.';
                ApplicationArea = All;
                Editable = false;
            }
            field("Part/Components"; Rec."Part/Components")
            {
                ToolTip = 'Specifies the value of the Part/Components field.';
                ApplicationArea = All;
                Editable = false;
            }
            // field("Parent Item Id"; Rec."Parent Item Id")
            // {
            //     ToolTip = 'Specifies the value of the Parent Item ID field.';
            //     ApplicationArea = All;
            // }
        }
        addafter("Tariff No.")
        {
            field("Impot Tariff Code"; Rec."Impot Tariff Code")
            {
                ToolTip = 'Specifies the value of the Impot Tariff Code field.';
                ApplicationArea = All;
                Editable = EditFalse;
            }
            field("Export Tariff Code"; Rec."Export Tariff Code")
            {
                ToolTip = 'Specifies the value of the Export Tariff Code field.';
                ApplicationArea = All;
                Editable = EditFalse;
            }
        }
        addafter("Reverse Charge Applies")
        {
            group("Market Pricing")
            {
                field("Competitor Average"; Rec."Competitor Average")
                {
                    ToolTip = 'Specifies the value of the Competitor Average field.';
                    ApplicationArea = All;
                }
                field("Market Average"; Rec."Market Average")
                {
                    ToolTip = 'Specifies the value of the Market Average field.';
                    ApplicationArea = All;
                }
                field("Recommended Price"; Rec."Recommended Price")
                {
                    ToolTip = 'Specifies the value of the Recommended Price field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if Rec."Parent Item" = '' then
            EditFalse := True;
    end;

    var
        EditFalse: Boolean;

}