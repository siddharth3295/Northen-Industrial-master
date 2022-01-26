pageextension 60006 BankAccountExt extends "Bank Account Card"
{
    layout
    {
        addlast(General)
        {
            field("Reporting Bank"; Rec."Reporting Bank")
            {
                ApplicationArea = All;
            }
        }
    }
}
