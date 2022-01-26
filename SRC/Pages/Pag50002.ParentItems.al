page 50002 "Parent Items"
{

    ApplicationArea = All;
    Caption = 'Parent Items';
    PageType = List;
    SourceTable = "Parent Items";
    UsageCategory = Lists;
    CardPageId = "Parent Item";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                // field("Without Special Chara"; Rec."Without Special Chara")
                // {
                //     ApplicationArea = all;
                // }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies the value of the Description 2 field.';
                    ApplicationArea = All;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ToolTip = 'Specifies the value of the Search Description field.';
                    ApplicationArea = All;
                }
                field(Salmasid; Rec.Salmasid)
                {
                    ToolTip = 'Specifies the value of the Salmasid field.';
                    ApplicationArea = All;
                }
                field(magentoid; Rec.magentoid)
                {
                    ToolTip = 'Specifies the value of the magentoid field.';
                    ApplicationArea = All;
                }
                field("Part Code"; Rec."Part Code")
                {
                    ToolTip = 'Specifies the value of the Part Code field.';
                    ApplicationArea = All;
                }
                field("Life Stage"; Rec."Life Stage")
                {
                    ToolTip = 'Specifies the value of the Life Stage field.';
                    ApplicationArea = All;
                }
                field("UOM Group"; Rec."UOM Group")
                {
                    ToolTip = 'Specifies the value of the UOM Group field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }

                field("Basic Unit of Meassure"; Rec."Basic Unit of Meassure")
                {
                    ToolTip = 'Specifies the value of the Basic Unit of Meassure field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Available New"; Rec."Available New")
                {
                    ToolTip = 'Specifies the value of the Available New field.';
                    ApplicationArea = All;
                }
                field("Available Refurbished"; Rec."Available Refurbished")
                {
                    ToolTip = 'Specifies the value of the Available Refurbished field.';
                    ApplicationArea = All;
                }
                field("Available Used"; Rec."Available Used")
                {
                    ToolTip = 'Specifies the value of the Available Used field.';
                    ApplicationArea = All;
                }
                field("No. of Images"; Rec."No. of Images")
                {
                    ToolTip = 'Specifies the value of the No. of Images field.';
                    ApplicationArea = All;
                }

            }
        }

    }
    // actions
    // {
    //     area(processing)
    //     {

    //         group(ActionGroupCRM)
    //         {
    //             Caption = 'Dynamics 365 Sales';
    //             // Visible = CRMIntegrationEnabled;
    //             // Enabled = (BlockedFilterApplied and (not Blocked)) or not BlockedFilterApplied;
    //             action(CRMGoToProduct)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Product';
    //                 Image = CoupledItem;
    //                 ToolTip = 'Open the coupled Dynamics 365 Sales Parent product.';

    //                 trigger OnAction()
    //                 var
    //                     CRMIntegrationManagement: Codeunit "CRM Integration Management";
    //                 begin
    //                     CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
    //                 end;
    //             }
    //             action(CRMSynchronizeNow)
    //             {
    //                 AccessByPermission = TableData "CRM Integration Record" = IM;
    //                 ApplicationArea = Suite;
    //                 Caption = 'Synchronize';
    //                 Image = Refresh;
    //                 ToolTip = 'Send updated data to Dynamics 365 Sales.';

    //                 trigger OnAction()
    //                 var
    //                     Item: Record "Parent Items";
    //                     CRMIntegrationManagement: Codeunit "CRM Integration Management";
    //                     ItemRecordRef: RecordRef;
    //                 begin
    //                     CurrPage.SetSelectionFilter(Item);
    //                     Item.Next;

    //                     if Item.Count = 1 then
    //                         CRMIntegrationManagement.UpdateOneNow(Item.RecordId)
    //                     else begin
    //                         ItemRecordRef.GetTable(Item);
    //                         CRMIntegrationManagement.UpdateMultipleNow(ItemRecordRef);
    //                     end
    //                 end;
    //             }
    //             group(Coupling)
    //             {
    //                 Caption = 'Coupling', Comment = 'Coupling is a noun';
    //                 Image = LinkAccount;
    //                 ToolTip = 'Create, change, or delete a coupling between the Business Central record and a Dynamics 365 Sales record.';
    //                 action(ManageCRMCoupling)
    //                 {
    //                     AccessByPermission = TableData "CRM Integration Record" = IM;
    //                     ApplicationArea = Suite;
    //                     Caption = 'Set Up Coupling';
    //                     Image = LinkAccount;
    //                     ToolTip = 'Create or modify the coupling to a Dynamics 365 Sales Parent product.';

    //                     trigger OnAction()
    //                     var
    //                         CRMIntegrationManagement: Codeunit "CRM Integration Management";
    //                     begin
    //                         CRMIntegrationManagement.DefineCoupling(Rec.RecordId);
    //                     end;
    //                 }
    //                 action(MatchBasedCoupling)
    //                 {
    //                     AccessByPermission = TableData "CRM Integration Record" = IM;
    //                     ApplicationArea = Suite;
    //                     Caption = 'Match-Based Coupling';
    //                     Image = CoupledItem;
    //                     ToolTip = 'Couple items to products in Dynamics 365 Sales based on criteria.';

    //                     trigger OnAction()
    //                     var
    //                         Item: Record "Parent Items";
    //                         CRMIntegrationManagement: Codeunit "CRM Integration Management";
    //                         RecRef: RecordRef;
    //                     begin
    //                         CurrPage.SetSelectionFilter(Item);
    //                         RecRef.GetTable(Item);
    //                         //CRMIntegrationManagement.MatchBasedCoupling(Item.RecordId);
    //                     end;
    //                 }
    //                 action(DeleteCRMCoupling)
    //                 {
    //                     AccessByPermission = TableData "CRM Integration Record" = D;
    //                     ApplicationArea = Suite;
    //                     Caption = 'Delete Coupling';
    //                     //Enabled = CRMIsCoupledToRecord;
    //                     Image = UnLinkAccount;
    //                     ToolTip = 'Delete the coupling to a Dynamics 365 Sales Parent product.';

    //                     trigger OnAction()
    //                     var
    //                         Item: Record "Parent Items";
    //                         CRMCouplingManagement: Codeunit "CRM Coupling Management";
    //                         RecRef: RecordRef;
    //                     begin
    //                         CurrPage.SetSelectionFilter(Item);
    //                         RecRef.GetTable(Item);
    //                         CRMCouplingManagement.RemoveCoupling(Item.RecordId);
    //                     end;
    //                 }
    //             }
    //             action(ShowLog)
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Synchronization Log';
    //                 Image = Log;
    //                 ToolTip = 'View integration synchronization jobs for the Parent item table.';

    //                 trigger OnAction()
    //                 var
    //                     CRMIntegrationManagement: Codeunit "CRM Integration Management";
    //                 begin
    //                     CRMIntegrationManagement.ShowLog(Rec.RecordId);
    //                 end;
    //             }
    //         }

    //     }
    // }

    actions
    {
        area(Processing)
        {
            action("Setup Coupling")
            {
                Caption = 'Set Up Coupling';
                ApplicationArea = All;
                Visible = true;
                Image = LinkAccount;
                ToolTip = 'Create or modify the coupling to a Common Data Service Price Category.';

                trigger OnAction();
                var
                    CRMIntegrationManagement1: Codeunit "CRM Integration Management";
                    ParentItems: Record "Parent Items";
                begin

                    if ParentItems.Get(Rec.Description) then
                        CRMIntegrationManagement1.DefineCoupling(ParentItems.RecordId);
                end;
            }

            action("Delete Coupling")
            {
                Caption = 'Delete Coupling';
                ApplicationArea = All;
                Visible = true;
                Image = UnLinkAccount;
                Enabled = CDSIsCoupledToRecord;
                ToolTip = 'Delete the coupling to a Common Data Service Price Category.';

                trigger OnAction();
                var
                    CRMCouplingManagement1: Codeunit "CRM Coupling Management";
                begin
                    CRMCouplingManagement1.RemoveCoupling(Rec.RecordId);
                end;
            }
            action("Show Log")
            {
                Caption = 'Synchronization Log';
                ApplicationArea = All;
                Visible = true;
                Image = Log;
                ToolTip = 'View integration synchronization jobs for the Price Category table.';

                trigger OnAction();
                var
                    CRMIntegrationManagement1: Codeunit "CRM Integration Management";
                begin
                    CRMIntegrationManagement1.ShowLog(Rec.RecordId);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        CDSIntegrationEnabled := CRMIntegrationManagement.IsCDSIntegrationEnabled();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if CDSIntegrationEnabled then CDSIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
    end;

    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        CDSIntegrationEnabled: Boolean;
        CDSIsCoupledToRecord: Boolean;

}