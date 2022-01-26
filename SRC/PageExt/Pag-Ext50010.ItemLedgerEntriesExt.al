pageextension 50010 "Item Ledger Entries Ext" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Item No.")
        {

            field("Part Code"; Rec."Part Code")
            {
                ToolTip = 'Specifies the value of the Part Code field.';
                ApplicationArea = All;
            }
        }
    }
}
