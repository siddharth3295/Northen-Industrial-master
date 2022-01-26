pageextension 50002 "Company Info Ext" extends "Company Information"
{
    layout
    {
        addafter(Picture)
        {
            field("Master Company"; Rec."Master Company")
            {
                ToolTip = 'Specifies the value of the Master Company field.';
                ApplicationArea = All;
            }
        }
    }
}