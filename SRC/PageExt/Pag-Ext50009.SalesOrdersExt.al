pageextension 50009 "Sales Orders Ext" extends "Sales Order List"
{
    actions
    {
        addafter(AttachAsPDF)
        {
            action("Order Confirmation")
            {
                Caption = 'Order Confirmation';
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Category8;
                Image = Print;
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    OrderConfirmation: Report "Order Confirmation";
                begin
                    SalesHeader.Reset();
                    SalesHeader.SetRange("No.", Rec."No.");
                    if SalesHeader.FindFirst() then
                        Report.Run(Report::"Order Confirmation", true, false, SalesHeader);
                end;
            }
        }
    }
}
