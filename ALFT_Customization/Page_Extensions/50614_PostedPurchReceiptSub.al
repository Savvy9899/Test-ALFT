pageextension 50614 PostedPurchReceiptSub extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        addafter("Order Date")
        {
            field("PR No."; "PR No.")
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