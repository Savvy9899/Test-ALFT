pageextension 50638 PostedSalesCrM extends "Posted Sales Credit Memos"
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