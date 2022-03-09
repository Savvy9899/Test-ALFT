pageextension 50630 PurchaseQuoteList extends "Purchase Quotes"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field(Completed; Completed)
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