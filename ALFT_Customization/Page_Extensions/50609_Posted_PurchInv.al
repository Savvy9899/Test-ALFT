pageextension 50609 PostedPurchInv extends "Posted Purchase Invoice"
{
    layout
    {
        addlast("Invoice Details")
        {
            field("Profoma Invoice No."; "Profoma Invoice No.")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Proforma Invoice No.';
            }
            field("L/C No."; "L/C No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addlast(General)
        {
            field("Purchase Requisition No."; "Purchase Requisition No.")
            {
                ApplicationArea = All;
                Editable = false;
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