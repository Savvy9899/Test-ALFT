pageextension 50607 PurchaseQuote extends "Purchase Quote"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Purchase Requisition"; "Purchase Requisition")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Purchase Requisition No."; "Purchase Requisition No.")
            {
                ApplicationArea = All;
            }
            field("Purch. Order No."; "Purch. Order No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addlast(General)
        {
            // field(Approved; Approved)
            // {
            //     ApplicationArea = All;
            // }
            field(Completed; Completed)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addlast("Invoice Details")
        {
            field("L/C No."; "L/C No.")
            {
                ApplicationArea = All;
            }
            field("Profoma Invoice No."; "Profoma Invoice No.")
            {
                ApplicationArea = All;
                Caption = 'Proforma Invoice No.';
            }
            field("PI Received"; "PI Received")
            {
                ApplicationArea = All;
            }
            field("LC Application Sent to Bank"; "LC Application Sent to Bank")
            {
                ApplicationArea = All;
            }
            field("LC Opened"; "LC Opened")
            {
                ApplicationArea = All;
            }
        }
        addafter("Due Date")
        {
            field("Required Before"; "Required Before")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter(CopyDocument)
        {
            action("Purchase Requisition Report")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Report;
                Caption = 'Purchase Requisition';

                trigger OnAction()
                begin
                    if Completed = true then begin
                        Error('Completed Purchase Requisitions cannot be printed');
                    end
                    else begin
                        purchHead.Reset();
                        purchHead.SetRange("Document Type", "Document Type");
                        purchHead.SetRange("No.", "No.");
                        Report.RunModal(50402, true, true, purchHead);
                    end;
                end;
            }
        }

    }
    var
        purchHead: Record "Purchase Header";

}