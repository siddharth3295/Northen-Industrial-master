page 50004 "Parent Item API"
{

    APIGroup = 'TPTPLGroup';
    APIPublisher = 'TPTPL';
    APIVersion = 'v2.0';
    Caption = 'parentItemAPI';
    DelayedInsert = true;
    EntityName = 'ParentItems';
    EntitySetName = 'ParentItems';
    PageType = API;
    SourceTable = "Parent Items";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'ID';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }

                field(searchDescription; Rec."Search Description")
                {
                    Caption = 'Search Description';
                }
                field(oem; Rec.OEM)
                {
                    Caption = 'OEM';
                }
            }
        }
    }

}
