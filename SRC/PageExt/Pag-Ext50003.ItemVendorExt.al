pageextension 50003 "Item Vendor Catalog Ext" extends "Item Vendor Catalog"
{
    layout
    {
        // Add changes to page layout here
        addafter("Vendor Item No.")
        {
            field("Vendor Item Name"; Rec."Vendor Item Name")
            {
                ToolTip = 'Specifies the value of the Vendor Item Name field.';
                ApplicationArea = All;
            }
            field("Quantity Available"; Rec."Quantity Available")
            {
                ToolTip = 'Specifies the value of the Quantity Available field.';
                ApplicationArea = All;
            }
            field("Country/Region Code"; Rec."Country/Region Code")
            {
                ToolTip = 'Specifies the value of the Country field.';
                ApplicationArea = All;
            }
            field("Currency Code"; Rec."Currency Code")
            {
                ToolTip = 'Specifies the value of the Currency Code field.';
                ApplicationArea = All;
            }
        }
    }
}