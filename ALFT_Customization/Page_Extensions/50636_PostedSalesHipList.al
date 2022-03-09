pageextension 50636 PostedSalelsShipList extends "Posted Sales Shipments"
{
    layout
    {
        addafter("No. Printed")
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