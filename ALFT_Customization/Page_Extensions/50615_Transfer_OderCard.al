pageextension 50615 TransferOrderCard extends "Transfer Order"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Transfer Order Type"; "Transfer Order Type")
            {
                ApplicationArea = All;
            }
            field("Prod. Ord. No."; "Prod. Ord. No.")
            {
                ApplicationArea = All;
                Caption = 'Production Order No.';
            }
        }
    }

    actions
    {
        addafter("Inventory - Inbound Transfer")
        {
            action("FG-Transfer Note")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    transHead.Reset();
                    transHead.SetRange("No.", "No.");
                    Report.RunModal(50412, true, true, transHead);
                end;
            }
        }
    }
    var
        transHead: Record "Transfer Header";
}