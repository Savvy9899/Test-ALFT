pageextension 50626 PurchaseReturn extends "Purchase Return Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(CalculateInvoiceDiscount)
        {
            action("Return Note")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    purchHead.Reset();
                    purchHead.SetRange("Document Type", "Document Type");
                    purchHead.SetRange("No.", "No.");
                    Report.RunModal(50416, true, true, purchHead);
                end;

            }
        }
    }

    var
        purchHead: Record "Purchase Header";
}