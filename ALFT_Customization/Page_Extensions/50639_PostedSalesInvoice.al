pageextension 50639 PostedSalesInvoice extends "Posted Sales Invoice"
{
    layout
    {
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
    }

    actions
    {
        addafter("&Track Package")
        {
            action("FG-Inclusive Invoice")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    saleRec.Reset();
                    saleRec.SetRange("No.", "No.");
                    Report.RunModal(50407, true, true, saleRec);
                end;
            }
            action("FG-SVAT Invoice")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    saleRec.Reset();
                    saleRec.SetRange("No.", "No.");
                    Report.RunModal(50409, true, true, saleRec);
                end;
            }
            action("FG-Tax Invoice")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    saleRec.Reset();
                    saleRec.SetRange("No.", "No.");
                    Report.RunModal(50411, true, true, saleRec);
                end;
            }
        }
    }

    var
        saleRec: Record "Sales Invoice Header";
}