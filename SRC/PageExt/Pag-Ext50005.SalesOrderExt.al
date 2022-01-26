pageextension 50006 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addafter("Work Description")
        {
            field("NIC Work Order Options"; Rec."NIC Work Order Options")
            {
                Caption = 'Work Order Type';
                ApplicationArea = all;
                Editable = false;
            }
            field("NIC_FG Serial No."; Rec."NIC_FG Serial No.")
            {
                ToolTip = 'Specifies the value of the FG Serial No. field.';
                ApplicationArea = All;
                Editable = false;
            }
            field("NIC_FG Item No."; Rec."NIC_FG Item No.")
            {
                ToolTip = 'Specifies the value of the FG Item No. field.';
                ApplicationArea = All;
                Editable = false;
            }

        }
    }
    actions
    {
        addafter("&Order Confirmation")
        {
            action(CreateProductionOrder)
            {
                ApplicationArea = all;
                Caption = 'Create Production Order';

                trigger OnAction()
                var
                    SalesOrdertoCRM: codeunit "Sales Order for CMR";
                begin
                    SalesOrdertoCRM.ProductionOrder(Rec);
                end;
            }
        }

        addafter(AttachAsPDF)
        {
            action("Order Confirmation")
            {
                Caption = 'Order Confirmation';
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Category11;
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var

    begin
        Rec.Validate("NIC Work Order Options", "NIC Work Order Options"::"Sales Order");
    end;
}
