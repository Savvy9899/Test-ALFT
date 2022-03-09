pageextension 50625 PostedSalesShip extends "Posted Sales Shipment"
{
    layout
    {
        addlast(Shipping)
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
    }

    actions
    {
        addafter("&Track Package")
        {
            action("Advice of Dispatch")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    saleShip.Reset();
                    saleShip.SetRange("No.", "No.");
                    Report.RunModal(50415, true, true, saleShip);
                end;

            }
        }
    }

    var
        saleShip: Record "Sales Shipment Header";
}