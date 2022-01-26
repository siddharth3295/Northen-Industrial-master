page 50006 "CRM Job Queue Entries"
{

    ApplicationArea = All;
    Caption = 'CRM Job Queue Entries';
    PageType = List;
    SourceTable = "CRM Job Queue Entries";
    UsageCategory = Administration;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Earliest Start Date/Time"; Rec."Earliest Start Date/Time")
                {
                    ToolTip = 'Specifies the value of the Earliest Start Date/Time field.';
                    ApplicationArea = All;
                }
                field("Ending Time"; Rec."Ending Time")
                {
                    ToolTip = 'Specifies the value of the Ending Time field.';
                    ApplicationArea = All;
                }
                field("Error Message"; Rec."Error Message")
                {
                    ToolTip = 'Specifies the value of the Error Message field.';
                    ApplicationArea = All;
                }
                field("Error Message Register Id"; Rec."Error Message Register Id")
                {
                    ToolTip = 'Specifies the value of the Error Message Register Id field.';
                    ApplicationArea = All;
                }
                field("Expiration Date/Time"; Rec."Expiration Date/Time")
                {
                    ToolTip = 'Specifies the value of the Expiration Date/Time field.';
                    ApplicationArea = All;
                }
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.';
                    ApplicationArea = All;
                }
                field("Inactivity Timeout Period"; Rec."Inactivity Timeout Period")
                {
                    ToolTip = 'Specifies the value of the Inactivity Timeout Period field.';
                    ApplicationArea = All;
                }
                field("Job Queue Category Code"; Rec."Job Queue Category Code")
                {
                    ToolTip = 'Specifies the value of the Job Queue Category Code field.';
                    ApplicationArea = All;
                }
                field("Job Timeout"; Rec."Job Timeout")
                {
                    ToolTip = 'Specifies the value of the Job Timeout field.';
                    ApplicationArea = All;
                }
                field("Last Ready State"; Rec."Last Ready State")
                {
                    ToolTip = 'Specifies the value of the Last Ready State field.';
                    ApplicationArea = All;
                }
                field("Manual Recurrence"; Rec."Manual Recurrence")
                {
                    ToolTip = 'Specifies the value of the Manual Recurrence field.';
                    ApplicationArea = All;
                }
                field("Maximum No. of Attempts to Run"; Rec."Maximum No. of Attempts to Run")
                {
                    ToolTip = 'Specifies the value of the Maximum No. of Attempts to Run field.';
                    ApplicationArea = All;
                }
                field("Next Run Date Formula"; Rec."Next Run Date Formula")
                {
                    ToolTip = 'Specifies the value of the Next Run Date Formula field.';
                    ApplicationArea = All;
                }
                field("No. of Attempts to Run"; Rec."No. of Attempts to Run")
                {
                    ToolTip = 'Specifies the value of the No. of Attempts to Run field.';
                    ApplicationArea = All;
                }
                field("No. of Minutes between Runs"; Rec."No. of Minutes between Runs")
                {
                    ToolTip = 'Specifies the value of the No. of Minutes between Runs field.';
                    ApplicationArea = All;
                }
                field("Notify On Success"; Rec."Notify On Success")
                {
                    ToolTip = 'Specifies the value of the Notify On Success field.';
                    ApplicationArea = All;
                }
                field("Object Caption to Run"; Rec."Object Caption to Run")
                {
                    ToolTip = 'Specifies the value of the Object Caption to Run field.';
                    ApplicationArea = All;
                }
                field("Object ID to Run"; Rec."Object ID to Run")
                {
                    ToolTip = 'Specifies the value of the Object ID to Run field.';
                    ApplicationArea = All;
                }
                field("Object Type to Run"; Rec."Object Type to Run")
                {
                    ToolTip = 'Specifies the value of the Object Type to Run field.';
                    ApplicationArea = All;
                }
                field("Parameter String"; Rec."Parameter String")
                {
                    ToolTip = 'Specifies the value of the Parameter String field.';
                    ApplicationArea = All;
                }
                field("Printer Name"; Rec."Printer Name")
                {
                    ToolTip = 'Specifies the value of the Printer Name field.';
                    ApplicationArea = All;
                }
                field("Record ID to Process"; Rec."Record ID to Process")
                {
                    ToolTip = 'Specifies the value of the Record ID to Process field.';
                    ApplicationArea = All;
                }
                field("Recovery Task Id"; Rec."Recovery Task Id")
                {
                    ToolTip = 'Specifies the value of the Recovery Task Id field.';
                    ApplicationArea = All;
                }
                field("Recurring Job"; Rec."Recurring Job")
                {
                    ToolTip = 'Specifies the value of the Recurring Job field.';
                    ApplicationArea = All;
                }
                field("Reference Starting Time"; Rec."Reference Starting Time")
                {
                    ToolTip = 'Specifies the value of the Reference Starting Time field.';
                    ApplicationArea = All;
                }
                field("Report Output Type"; Rec."Report Output Type")
                {
                    ToolTip = 'Specifies the value of the Report Output Type field.';
                    ApplicationArea = All;
                }
                field("Report Request Page Options"; Rec."Report Request Page Options")
                {
                    ToolTip = 'Specifies the value of the Report Request Page Options field.';
                    ApplicationArea = All;
                }
                field("Rerun Delay (sec.)"; Rec."Rerun Delay (sec.)")
                {
                    ToolTip = 'Specifies the value of the Rerun Delay (sec.) field.';
                    ApplicationArea = All;
                }
                field("Run in User Session"; Rec."Run in User Session")
                {
                    ToolTip = 'Specifies the value of the Run in User Session field.';
                    ApplicationArea = All;
                }
                field("Run on Fridays"; Rec."Run on Fridays")
                {
                    ToolTip = 'Specifies the value of the Run on Fridays field.';
                    ApplicationArea = All;
                }
                field("Run on Mondays"; Rec."Run on Mondays")
                {
                    ToolTip = 'Specifies the value of the Run on Mondays field.';
                    ApplicationArea = All;
                }
                field("Run on Saturdays"; Rec."Run on Saturdays")
                {
                    ToolTip = 'Specifies the value of the Run on Saturdays field.';
                    ApplicationArea = All;
                }
                field("Run on Sundays"; Rec."Run on Sundays")
                {
                    ToolTip = 'Specifies the value of the Run on Sundays field.';
                    ApplicationArea = All;
                }
                field("Run on Thursdays"; Rec."Run on Thursdays")
                {
                    ToolTip = 'Specifies the value of the Run on Thursdays field.';
                    ApplicationArea = All;
                }
                field("Run on Tuesdays"; Rec."Run on Tuesdays")
                {
                    ToolTip = 'Specifies the value of the Run on Tuesdays field.';
                    ApplicationArea = All;
                }
                field("Run on Wednesdays"; Rec."Run on Wednesdays")
                {
                    ToolTip = 'Specifies the value of the Run on Wednesdays field.';
                    ApplicationArea = All;
                }
                field(Scheduled; Rec.Scheduled)
                {
                    ToolTip = 'Specifies the value of the Scheduled field.';
                    ApplicationArea = All;
                }
                field("Starting Time"; Rec."Starting Time")
                {
                    ToolTip = 'Specifies the value of the Starting Time field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
                field("System Task ID"; Rec."System Task ID")
                {
                    ToolTip = 'Specifies the value of the System Task ID field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                    ApplicationArea = All;
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                    ApplicationArea = All;
                }
                field("User Language ID"; Rec."User Language ID")
                {
                    ToolTip = 'Specifies the value of the User Language ID field.';
                    ApplicationArea = All;
                }
                field("User Service Instance ID"; Rec."User Service Instance ID")
                {
                    ToolTip = 'Specifies the value of the User Service Instance ID field.';
                    ApplicationArea = All;
                }
                field("User Session ID"; Rec."User Session ID")
                {
                    ToolTip = 'Specifies the value of the User Session ID field.';
                    ApplicationArea = All;
                }
                field("User Session Started"; Rec."User Session Started")
                {
                    ToolTip = 'Specifies the value of the User Session Started field.';
                    ApplicationArea = All;
                }
                field(XML; Rec.XML)
                {
                    ToolTip = 'Specifies the value of the XML field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            group("Create Actual Job Queue")
            {
                Caption = 'Create Actual Job Queue';
                Image = DataEntry;
                action(Attributes)
                {
                    AccessByPermission = TableData "Item Attribute" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Create Actual Job Queue';
                    Image = Category;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;

                    trigger OnAction()
                    var
                        JobQ: Record "Job Queue Entry";
                    begin
                        JobQ.Init();
                        JobQ.Copy(Rec);
                        JobQ.id := CreateGuid();
                        JobQ.Insert(true);
                    end;
                }

            }
        }
    }
}

