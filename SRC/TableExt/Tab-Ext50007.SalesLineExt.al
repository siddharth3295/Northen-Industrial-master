tableextension 50007 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50000; Component; Boolean)
        {
            //Editable = false;
            Caption = 'Component';
            DataClassification = ToBeClassified;
        }
        field(50001; "FG Line No"; Integer)
        {
            //Editable = false;
            Caption = 'FG Line No';
            DataClassification = ToBeClassified;
        }
        field(50002; "Need to Convert"; Boolean)
        {
            //Editable = false;
            Caption = 'Need to Convert';
            DataClassification = ToBeClassified;
        }

        field(50003; "NIC_Serial No."; Text[20])
        {
            //Editable = false;
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(50004; "Part Code"; Code[50])
        {
            Caption = 'Part Code';
            DataClassification = ToBeClassified;
        }
    }
}
