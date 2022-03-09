pageextension 50628 SalesReturnOrder extends "Sales Return Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Create Return-Related &Documents")
        {
            action("Material Loan Out")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    saleRec.Reset();
                    saleRec.SetRange("Document Type", "Document Type");
                    saleRec.SetRange("No.", "No.");
                    Report.RunModal(50420, true, true, saleRec);
                end;
            }
        }
    }

    var
        saleRec: Record "Sales Header";
}