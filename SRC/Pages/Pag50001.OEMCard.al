page 50001 "OEM Card"
{
    Caption = 'OEM';
    PageType = Card;
    SourceTable = OEM;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                }
                field("OEM Type"; Rec."OEM Type")
                {
                    ToolTip = 'Specifies the value of the OEM Type field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Creation)
        {
            group(ActionGroupCRM)
            {
                Caption = 'Dynamics 365 Sales';
                //Visible = CRMIntegrationEnabled;
                //Enabled = (BlockedFilterApplied and (not Blocked)) or not BlockedFilterApplied;
                action(CRMGoToProduct)
                {
                    ApplicationArea = Suite;
                    Caption = 'Product';
                    Image = CoupledItem;
                    ToolTip = 'Open the coupled Dynamics 365 Sales product.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record" = IM;
                    ApplicationArea = Suite;
                    Caption = 'Synchronize';
                    Image = Refresh;
                    ToolTip = 'Send updated data to Dynamics 365 Sales.';

                    trigger OnAction()
                    var
                        OEM: Record OEM;
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        OEMRecordRef: RecordRef;
                    begin
                        CurrPage.SetSelectionFilter(Rec);
                        OEM.Next;

                        if OEM.Count = 1 then
                            CRMIntegrationManagement.UpdateOneNow(OEM.RecordId)
                        else begin
                            OEMRecordRef.GetTable(OEM);
                            CRMIntegrationManagement.UpdateMultipleNow(OEMRecordRef);
                        end
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling', Comment = 'Coupling is a noun';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Business Central record and a Dynamics 365 Sales record.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = Suite;
                        Caption = 'Set Up Coupling';
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Dynamics 365 Sales product.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(Rec.RecordId);
                        end;
                    }
                    // action(MatchBasedCoupling)
                    // {
                    //     AccessByPermission = TableData "CRM Integration Record" = IM;
                    //     ApplicationArea = Suite;
                    //     Caption = 'Match-Based Coupling';
                    //     Image = CoupledItem;
                    //     ToolTip = 'Couple items to products in Dynamics 365 Sales based on criteria.';

                    //     trigger OnAction()
                    //     var
                    //         Item: Record Item;
                    //         CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    //         RecRef: RecordRef;
                    //     begin
                    //         CurrPage.SetSelectionFilter(Rec);
                    //         RecRef.GetTable(Rec);
                    //         CRMIntegrationManagement.MatchBasedCoupling(Database::OEM);
                    //     end;
                    // }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = D;
                        ApplicationArea = Suite;
                        Caption = 'Delete Coupling';
                        //Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTip = 'Delete the coupling to a Dynamics 365 Sales product.';

                        trigger OnAction()
                        var
                            Item: Record Item;
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                            RecRef: RecordRef;
                        begin
                            CurrPage.SetSelectionFilter(Rec);
                            RecRef.GetTable(Rec);
                            CRMCouplingManagement.RemoveCoupling(Rec.RecordId);
                        end;
                    }
                }
            }
        }
    }
}