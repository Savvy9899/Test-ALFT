pageextension 50633 "Contact Card" extends "Contact Card"
{
    layout
    {
        addafter("E-Mail")
        {
            field("E-Mail 2"; "E-Mail 2")
            {
                ApplicationArea = All;
            }
            field("E-mail 3"; "E-mail 3")
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