pageextension 50642 "ItemLedgerEntryExt" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Location Code")
        {
            field("Prod. Ord. No."; "Prod. Ord. No.")
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