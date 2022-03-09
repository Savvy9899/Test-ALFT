pageextension 50612 PurchaseQuoteSub extends "Purchase Quote Subform"
{
    layout
    {
        addafter("Qty. Assigned")
        {
            field("PR No."; "PR No.")
            {
                ApplicationArea = All;
            }
            field("COO-Approved"; "COO-Approved")
            {
                ApplicationArea = All;
            }
            field("MD-Approved"; "MD-Approved")
            {
                ApplicationArea = All;
            }
            field("DEP-Checked"; "DEP-Checked")
            {
                ApplicationArea = All;
            }
            field(Completed; Completed)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("DO-Approved"; "DO-Approved")
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