pageextension 50629 SalesOrderSub extends "Sales Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("No. 2"; "No. 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("ALFT No.")
        {
            field("Sales Order Type"; "Sales Order Type")
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