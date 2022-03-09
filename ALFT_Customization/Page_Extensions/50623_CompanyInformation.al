pageextension 50623 CompanyInformation extends "Company Information"
{
    layout
    {
        addlast(General)
        {
            field("NBT Registration No."; "NBT Registration No.")
            {
                ApplicationArea = All;
            }
            field("SVAT Registration No."; "SVAT Registration No.")
            {
                ApplicationArea = All;
            }
            field("SVAT %"; "SVAT %")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}