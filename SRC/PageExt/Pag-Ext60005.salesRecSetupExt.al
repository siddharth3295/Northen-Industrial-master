pageextension 60005 "sales&RecSetupExt" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Document Default Line Type")
        {
            field(Email; Rec.Email)
            {
                ApplicationArea = All;
            }
            field("CRM Order Location"; Rec."NIC CRM Order Location")
            {
                ToolTip = 'Specifies the value of the CRM Order Location field.';
                ApplicationArea = All;
            }
        }
    }
}
