pageextension 50637 PostedSalesInvList extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Amount Including VAT")
        {
            field("Item No."; "Item No.")
            {
                ApplicationArea = All;
            }
            field("Item Description"; "Item Description")
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