pageextension 50605 SalesQuote extends "Sales Quote"
{
    layout
    {
        addlast(General)
        {
            field(Approved; Approved)
            {
                ApplicationArea = All;
            }
        }
        addafter("Assigned User ID")
        {
            field(Confirmation; Confirmation)
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