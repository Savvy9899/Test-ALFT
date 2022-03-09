pageextension 50613 PostedPurchaseInvSub extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter("Job No.")
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