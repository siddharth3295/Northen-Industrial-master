pageextension 50007 "Sales Order Subform Ext" extends "Sales Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field(Component; Rec.Component)
            {
                Caption = 'Component';
                ApplicationArea = all;
                Visible = false;
            }
            field("Need to Convert"; Rec."Need to Convert")
            {
                Caption = 'Need to Convert';
                ApplicationArea = all;
                Visible = false;
            }
            field("NIC_Serial No."; Rec."NIC_Serial No.")
            {
                ToolTip = 'Specifies the value of the Serial No. field.';
                ApplicationArea = All;
                Visible = false;
            }
            field("Part Code"; Rec."Part Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
