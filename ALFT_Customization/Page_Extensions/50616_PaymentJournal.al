pageextension 50616 PaymentJournal extends "Payment Journal"
{
    layout
    {
        modify("Message to Recipient")
        {
            Caption = 'Description 2';
        }

    }

    actions
    {
        addafter(Reconcile)
        {
            action("Check Print")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    genRec.Reset();
                    genRec.SetRange("Journal Template Name", "Journal Template Name");
                    genRec.SetRange("Journal Batch Name", "Journal Batch Name");
                    genRec.SetRange("Document No.", "Document No.");
                    genRec.SetRange("Line No.", "Line No.");
                    Report.RunModal(50400, true, true, genRec);
                end;
            }
            action("Payment Voucher")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    genRec.Reset();
                    genRec.SetRange("Journal Template Name", "Journal Template Name");
                    genRec.SetRange("Journal Batch Name", "Journal Batch Name");
                    genRec.SetRange("Document No.", "Document No.");
                    genRec.SetRange("Line No.", "Line No.");
                    Report.RunModal(50405, true, true, genRec);
                end;
            }
        }
    }

    var
        genRec: Record "Gen. Journal Line";
}