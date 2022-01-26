page 50008 "Vendor Import Buffer"
{
    Caption = 'Vendor Item Buffer';
    AutoSplitKey = true;
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SaveValues = true;
    UsageCategory = Tasks;
    ApplicationArea = All;
    SourceTable = "Vendor Item Buffer";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Vendor Code"; Rec."Vendor Code")
                {
                    ToolTip = 'Specifies the value of the Vendor Code field.';
                    ApplicationArea = All;
                }
                field("Vendor Item Name"; Rec."Vendor Item Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Item Name field.';
                    ApplicationArea = All;
                }
                field("Part Code"; Rec."Part Code")
                {
                    ToolTip = 'Specifies the value of the Part Code field.';
                    ApplicationArea = All;
                }
                field("File Name"; Rec."File Name")
                {
                    ToolTip = 'Specifies the value of the File Name field.';
                    ApplicationArea = All;
                }
                field("Imported Date"; Rec."Imported Date")
                {
                    ToolTip = 'Specifies the value of the Imported Date field.';
                    ApplicationArea = All;
                }
                field("Imported Time"; Rec."Imported Time")
                {
                    ToolTip = 'Specifies the value of the Imported Time field.';
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                    ApplicationArea = All;
                }
                field("Sheet Name"; Rec."Sheet Name")
                {
                    ToolTip = 'Specifies the value of the Sheet Name field.';
                    ApplicationArea = All;
                }
                field(Condition; Rec.Condition)
                {
                    ToolTip = 'Specifies the value of the Condition field.';
                    ApplicationArea = All;
                }
                field("Cost Price"; Rec."Cost Price")
                {
                    ToolTip = 'Specifies the value of the Cost Price field.';
                    ApplicationArea = All;
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country field.';
                    ApplicationArea = All;
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ToolTip = 'Specifies the value of the Lead Time Calculation field.';
                    ApplicationArea = All;
                }

                field("Qty Available"; Rec."Qty Available")
                {
                    ToolTip = 'Specifies the value of the Qty Available field.';
                    ApplicationArea = All;
                }
                field("Error Context"; Rec."Error Context")
                {
                    ToolTip = 'Specifies the value of the Error Context field.';
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                    ApplicationArea = All;
                }

            }
        }
    }
    actions
    {
        area(processing)
        {
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';

                trigger OnAction()
                var
                    VendorItemImportMgnt: Codeunit "Vendor Item Import Mgmt";
                begin

                    VendorItemImportMgnt.ReadExcelSheet();
                end;
            }

        }
    }







}
