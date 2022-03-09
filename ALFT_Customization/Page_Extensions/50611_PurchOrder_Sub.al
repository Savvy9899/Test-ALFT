pageextension 50611 PurchaseOrderSub extends "Purchase Order Subform"
{
    layout
    {
        addafter("Bin Code")
        {
            field("HS Code"; "HS Code")
            {
                ApplicationArea = All;
            }
            field("Last Purchase Price"; "Last Purchase Price")
            {
                ApplicationArea = All;
            }
            field("PR No."; "PR No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Over-Receipt Code")
        {
            field("DEP-Checked"; "DEP-Checked")
            {
                ApplicationArea = All;
            }
            field("DO-Approved"; "DO-Approved")
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
        }

    }

    actions
    { }

    var
        myInt: Integer;
}