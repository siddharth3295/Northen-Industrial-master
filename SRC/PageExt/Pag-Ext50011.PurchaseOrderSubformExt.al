pageextension 50011 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{

    layout
    {
        addafter("No.")
        {
            field("Part Code"; Rec."Part Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}