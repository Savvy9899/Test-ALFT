pageextension 50640 PurchOrders extends "Purchase Order List"
{
    layout
    {
        addafter("No.")
        {
            field("Purchase Requisition No."; "Purchase Requisition No.")
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