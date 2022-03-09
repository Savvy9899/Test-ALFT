pageextension 50624 SalesCrMemo extends "Sales Credit Memo"
{
    layout
    { }

    actions
    {
        addafter(CopyDocument)
        {
            action("FG-Inclusive Credit Note")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    saleCr.Reset();
                    saleCr.SetRange("No.", "No.");
                    Report.RunModal(50406, true, true, saleCr);
                end;
            }
            action("FG-SVAT Credit Note")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    saleCr.Reset();
                    saleCr.SetRange("No.", "No.");
                    Report.RunModal(50408, true, true, saleCr);
                end;
            }
            action("FG-Tax Credit Note")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    saleCr.Reset();
                    saleCr.SetRange("No.", "No.");
                    Report.RunModal(50410, true, true, saleCr);
                end;
            }
        }
    }

    var
        saleCr: Record "Sales Cr.Memo Header";
}