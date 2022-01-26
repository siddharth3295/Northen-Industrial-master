page 50005 "CRM Parent Items"
{

    ApplicationArea = All;
    Caption = 'CRM Parent Items';
    PageType = List;
    SourceTable = "CRM Parent Items";
    UsageCategory = Administration;
    Editable = false;


    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;


                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies the value of the Description 2 field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ToolTip = 'Specifies the value of the Search Description field.';
                    ApplicationArea = All;
                }
                field(OEM; Rec.OEM)
                {
                    ToolTip = 'Specifies the value of the OEM field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ShowOnlyUncoupled)
            {
                ApplicationArea = Suite;
                Caption = 'Hide Coupled Products';
                Image = FilterLines;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Do not show coupled products.';

                trigger OnAction()
                begin
                    MarkedOnly(true);
                end;
            }
            action(ShowAll)
            {
                ApplicationArea = Suite;
                Caption = 'Show Coupled Products';
                Image = ClearFilter;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Show coupled products.';

                trigger OnAction()
                begin
                    MarkedOnly(false);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        CRMIntegrationRecord: Record "CRM Integration Record";
        RecordID: RecordID;
        CurrentlyCoupledCRMPrcCat: Record "CRM Parent Items";
        PrcCatId: Guid;
        Coupled: Text[30];
        FirstColumnStyle: Text[30];
    begin
        IF CRMIntegrationRecord.FindRecordIDFromID(PrcCatId, DATABASE::"Parent Items", RecordID) THEN
            IF CurrentlyCoupledCRMPrcCat.new_productparentitemid = PrcCatId THEN BEGIN
                Coupled := 'Current';
                FirstColumnStyle := 'Strong';
            END ELSE BEGIN
                Coupled := 'Yes';
                FirstColumnStyle := 'Subordinate';
            END
        ELSE BEGIN
            Coupled := 'No';
            FirstColumnStyle := 'None';
        END;
    end;

    trigger OnOpenPage()
    var
        LookupCRMTables: Codeunit "Lookup CRM Tables";
    begin
        Rec.FILTERGROUP(4);
        Rec.SETVIEW(LookupCRMTables.GetIntegrationTableMappingView(DATABASE::"Parent Items"));
        Rec.FILTERGROUP(0);
    end;

    trigger OnInit()
    begin
        Codeunit.Run(Codeunit::"CRM Integration Management");
    end;



}


