pageextension 50610 PostedPurchReceipt extends "Posted Purchase Receipt"
{
    layout
    {
        addafter("Responsibility Center")
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
    }

    actions
    {
        addafter("&Print")
        {
            action(GRN)
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    purchRecHead.Reset();
                    purchRecHead.SetRange("No.", "No.");
                    Report.RunModal(50417, true, true, purchRecHead);
                end;
            }
            action("GRN Return")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    purchRecHead.Reset();
                    purchRecHead.SetRange("No.", "No.");
                    Report.RunModal(50418, true, true, purchRecHead);
                end;
            }

        }
    }

    var
        purchRecHead: Record "Purch. Rcpt. Header";
}