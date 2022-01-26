table 50009 "CRM Job Queue Entries"
{
    Caption = 'CRM Job Queue Entries';
    DataCaptionFields = "Object Type to Run", "Object ID to Run", "Object Caption to Run";
    DrillDownPageID = "Job Queue Entries";
    LookupPageID = "Job Queue Entries";
    Permissions = TableData "Job Queue Entry" = rimd,
                  TableData "Job Queue Log Entry" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; ID; Guid)
        {
            Caption = 'ID';
        }
        field(2; "User ID"; Text[65])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
        }
        field(3; XML; BLOB)
        {
            Caption = 'XML';
        }
        field(4; "Last Ready State"; DateTime)
        {
            Caption = 'Last Ready State';
            Editable = false;
        }
        field(5; "Expiration Date/Time"; DateTime)
        {
            Caption = 'Expiration Date/Time';



        }
        field(6; "Earliest Start Date/Time"; DateTime)
        {
            Caption = 'Earliest Start Date/Time';


        }
        field(7; "Object Type to Run"; Option)
        {
            Caption = 'Object Type to Run';
            InitValue = "Report";
            OptionCaption = ',,,Report,,Codeunit';
            OptionMembers = ,,,"Report",,"Codeunit";

            trigger OnValidate()
            begin
                if "Object Type to Run" <> xRec."Object Type to Run" then
                    Validate("Object ID to Run", 0);
            end;
        }
        field(8; "Object ID to Run"; Integer)
        {
            Caption = 'Object ID to Run';
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = FIELD("Object Type to Run"));


        }
        field(9; "Object Caption to Run"; Text[250])
        {
            CalcFormula = Lookup(AllObjWithCaption."Object Caption" WHERE("Object Type" = FIELD("Object Type to Run"),
                                                                           "Object ID" = FIELD("Object ID to Run")));
            Caption = 'Object Caption to Run';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Report Output Type"; Option)
        {
            Caption = 'Report Output Type';
            OptionCaption = 'PDF,Word,Excel,Print,None (Processing only)';
            OptionMembers = PDF,Word,Excel,Print,"None (Processing only)";


        }
        field(11; "Maximum No. of Attempts to Run"; Integer)
        {
            Caption = 'Maximum No. of Attempts to Run';
        }
        field(12; "No. of Attempts to Run"; Integer)
        {
            Caption = 'No. of Attempts to Run';
            Editable = false;
        }
        field(13; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Ready,In Process,Error,On Hold,Finished,On Hold with Inactivity Timeout';
            OptionMembers = Ready,"In Process",Error,"On Hold",Finished,"On Hold with Inactivity Timeout";
        }
        field(14; Priority; Integer)
        {
            Caption = 'Priority';
            InitValue = 1000;
            ObsoleteState = Removed;
            ObsoleteReason = 'No longer supported.';
            ObsoleteTag = '15.0';
        }
        field(15; "Record ID to Process"; RecordID)
        {
            Caption = 'Record ID to Process';
            DataClassification = CustomerContent;
        }
        field(16; "Parameter String"; Text[250])
        {
            Caption = 'Parameter String';
        }
        field(17; "Recurring Job"; Boolean)
        {
            Caption = 'Recurring Job';
        }
        field(18; "No. of Minutes between Runs"; Integer)
        {
            Caption = 'No. of Minutes between Runs';

            trigger OnValidate()
            begin
                Clear("Next Run Date Formula");
                //SetRecurringField();
                //SetMinimumNumberOfMinutesBetweenRuns();
            end;
        }
        field(19; "Run on Mondays"; Boolean)
        {
            Caption = 'Run on Mondays';

            trigger OnValidate()
            begin
                Clear("Next Run Date Formula");
                //SetRecurringField();
            end;
        }
        field(20; "Run on Tuesdays"; Boolean)
        {
            Caption = 'Run on Tuesdays';

            trigger OnValidate()
            begin
                Clear("Next Run Date Formula");
                //SetRecurringField();
            end;
        }
        field(21; "Run on Wednesdays"; Boolean)
        {
            Caption = 'Run on Wednesdays';

            trigger OnValidate()
            begin
                Clear("Next Run Date Formula");
                //SetRecurringField();
            end;
        }
        field(22; "Run on Thursdays"; Boolean)
        {
            Caption = 'Run on Thursdays';

            trigger OnValidate()
            begin
                Clear("Next Run Date Formula");
                //SetRecurringField();
            end;
        }
        field(23; "Run on Fridays"; Boolean)
        {
            Caption = 'Run on Fridays';

            trigger OnValidate()
            begin
                Clear("Next Run Date Formula");
                //SetRecurringField();
            end;
        }
        field(24; "Run on Saturdays"; Boolean)
        {
            Caption = 'Run on Saturdays';

            trigger OnValidate()
            begin
                Clear("Next Run Date Formula");
                ////SetRecurringField();
            end;
        }
        field(25; "Run on Sundays"; Boolean)
        {
            Caption = 'Run on Sundays';

            trigger OnValidate()
            begin
                Clear("Next Run Date Formula");
                //SetRecurringField();
            end;
        }
        field(26; "Starting Time"; Time)
        {
            Caption = 'Starting Time';

            trigger OnValidate()
            begin
                TestField("Recurring Job");
                if "Starting Time" = 0T then
                    "Reference Starting Time" := 0DT
                else
                    "Reference Starting Time" := CreateDateTime(DMY2Date(1, 1, 2000), "Starting Time");
            end;
        }
        field(27; "Ending Time"; Time)
        {
            Caption = 'Ending Time';

            trigger OnValidate()
            begin
                TestField("Recurring Job");
            end;
        }
        field(28; "Reference Starting Time"; DateTime)
        {
            Caption = 'Reference Starting Time';
            Editable = false;

            trigger OnValidate()
            begin
                "Starting Time" := DT2Time("Reference Starting Time");
            end;
        }
        field(29; "Next Run Date Formula"; DateFormula)
        {
            Caption = 'Next Run Date Formula';
            DataClassification = SystemMetadata;


        }
        field(30; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(31; "Run in User Session"; Boolean)
        {
            Caption = 'Run in User Session';
            Editable = false;
        }
        field(32; "User Session ID"; Integer)
        {
            Caption = 'User Session ID';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(33; "Job Queue Category Code"; Code[10])
        {
            Caption = 'Job Queue Category Code';
            TableRelation = "Job Queue Category";
        }
        field(34; "Error Message"; Text[2048])
        {
            Caption = 'Error Message';
        }
        field(35; "Error Message 2"; Text[250])
        {
            Caption = 'Error Message 2';
            ObsoleteReason = 'Error Message field size has been increased.';
            ObsoleteState = Removed;
            ObsoleteTag = '15.0';
        }
        field(36; "Error Message 3"; Text[250])
        {
            Caption = 'Error Message 3';
            ObsoleteReason = 'Error Message field size has been increased.';
            ObsoleteState = Removed;
            ObsoleteTag = '15.0';
        }
        field(37; "Error Message 4"; Text[250])
        {
            Caption = 'Error Message 4';
            ObsoleteReason = 'Error Message field size has been increased.';
            ObsoleteState = Removed;
            ObsoleteTag = '15.0';
        }
        field(40; "User Service Instance ID"; Integer)
        {
            Caption = 'User Service Instance ID';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(41; "User Session Started"; DateTime)
        {
            Caption = 'User Session Started';
            Editable = false;
        }
        field(42; "Timeout (sec.)"; Integer)
        {
            Caption = 'Timeout (sec.)';
            MinValue = 0;
            ObsoleteState = Removed;
            ObsoleteReason = 'No longer supported.';
            ObsoleteTag = '15.0';
        }
        field(43; "Notify On Success"; Boolean)
        {
            Caption = 'Notify On Success';
        }
        field(44; "User Language ID"; Integer)
        {
            Caption = 'User Language ID';
        }
        field(45; "Printer Name"; Text[250])
        {
            Caption = 'Printer Name';


        }
        field(46; "Report Request Page Options"; Boolean)
        {
            Caption = 'Report Request Page Options';

            // trigger OnValidate()
            // begin
            //     if "Report Request Page Options" then
            //         RunReportRequestPage()
            //     else begin
            //         Clear(XML);
            //         Message(RequestPagesOptionsDeletedMsg);
            //         "User ID" := UserId();
            //     end;
            // end;
        }
        field(47; "Rerun Delay (sec.)"; Integer)
        {
            Caption = 'Rerun Delay (sec.)';
            MaxValue = 3600;
            MinValue = 0;
        }
        field(48; "System Task ID"; Guid)
        {
            Caption = 'System Task ID';
        }
        field(49; Scheduled; Boolean)
        {
            CalcFormula = Exist("Scheduled Task" WHERE(ID = FIELD("System Task ID")));
            Caption = 'Scheduled';
            FieldClass = FlowField;
        }
        field(50; "Manual Recurrence"; Boolean)
        {
            Caption = 'Manual Recurrence';
        }
        field(51; "On Hold Due to Inactivity"; Boolean)
        {
            Caption = 'On Hold Due to Inactivity';
            ObsoleteReason = 'Functionality moved into new job queue status';
            ObsoleteState = Removed;
            ObsoleteTag = '18.0';
        }
        field(52; "Inactivity Timeout Period"; Integer)
        {
            Caption = 'Inactivity Timeout Period';
            MinValue = 5;
            InitValue = 5;
        }
        field(53; "Error Message Register Id"; Guid)
        {
            Caption = 'Error Message Register Id';
            DataClassification = SystemMetadata;
            TableRelation = "Error Message Register".ID;
        }
        field(54; "Job Timeout"; Duration)
        {
            Caption = 'Job Timeout';
            DataClassification = SystemMetadata;
        }
        field(55; "Recovery Task Id"; Guid)
        {
            Caption = 'Recovery Task Id';
            Editable = false;
            DataClassification = SystemMetadata;
            ObsoleteState = Pending;
            ObsoleteReason = 'The recovery job is no longer needed.';
            ObsoleteTag = '19.0';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
        key(Key2; "Job Queue Category Code")
        {
        }
        key(Key3; "Last Ready State")
        {
        }
        key(Key4; "Recurring Job")
        {
        }
        key(Key5; "System Task ID")
        {
        }
    }

    fieldgroups
    {
    }


}
