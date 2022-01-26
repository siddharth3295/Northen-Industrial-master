pageextension 50008 "NIC Purchase & Pay Setup" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Quote Nos.")
        {
            field("OEM Nos."; Rec."OEM Nos.")
            {
                ApplicationArea = all;
            }
        }
    }
}
