report 50010 "Sales Order CRM to BC"
{
    UsageCategory = Administration;
    UseRequestPage = false;

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = where(Number = const(1));

            trigger OnAfterGetRecord()
            var
                CRMORDER: Record "CRM Salesorder";
                SalesHeader: Record "Sales Header";
                CRMSalesOrderToSalesOrder: Codeunit "CRM Sales Order to Sales Order";
            begin
                CODEUNIT.Run(CODEUNIT::"CRM Integration Management");
                CRMORDER.SetRange(StateCode, CRMORDER.StateCode::Submitted);
                if CRMORDER.FindSet() then
                    repeat
                        if CRMSalesOrderToSalesOrder.CreateInNAV(CRMORDER, SalesHeader) then begin
                            Commit();
                        end;
                    until CRMORDER.Next() = 0;
            end;
        }
    }
}
