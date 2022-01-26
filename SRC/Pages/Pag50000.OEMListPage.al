page 50000 "OEM List Page List"
{
    Caption = 'OEM List';
    PageType = List;
    SourceTable = OEM;
    CardPageId = "OEM Card";
    ApplicationArea = All;
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
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

}
