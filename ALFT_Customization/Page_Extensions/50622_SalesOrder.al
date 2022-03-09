pageextension 50622 SalesOrderExtension extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("ALFT Quote No."; "ALFT Quote No.")
            {
                ApplicationArea = All;
            }
        }
        addlast("Shipping and Billing")
        {
            field("Vehicle No."; "Vehicle No.")
            {
                ApplicationArea = All;
            }
            field("Driver No."; "Driver No.")
            {
                ApplicationArea = All;
            }
            field("No of Reels/Boxes/Bundle"; "No of Reels/Boxes/Bundle")
            {
                ApplicationArea = All;
            }
            field("Qty per Reels/Boxes/Bundle"; "Qty per Reels/Boxes/Bundle")
            {
                ApplicationArea = All;
            }
        }
        modify("Quote No.")
        {
            Visible = false;
        }
        modify("Order Date")
        {
            Editable = false;
        }
    }

    actions
    {
        modify(Release)
        {
            trigger OnBeforeAction()
            var
                saleLine: Record "Sales Line";
            begin
                saleLine.Reset();
                saleLine.SetRange("Document No.", "No.");
            end;
        }
    }

    var
        saleRec: Record "Sales Header";
}