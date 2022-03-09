pageextension 50608 PurchaseOrder extends "Purchase Order"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field("Purchase Requisition No."; "Purchase Requisition No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addlast("Invoice Details")
        {
            field("Profoma Invoice No."; "Profoma Invoice No.")
            {
                ApplicationArea = All;
                Caption = 'Proforma Invoice No.';
            }
            field("L/C No."; "L/C No.")
            {
                ApplicationArea = All;
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
        addlast(General)
        {
            field(Remarks; Remarks)
            {
                ApplicationArea = All;
            }
        }
        addlast("Shipping and Payment")
        {
            field("Delivery Term"; "Delivery Term")
            {
                ApplicationArea = All;
            }
        }
        modify("Order Date")
        {
            Editable = false;
        }
        // modify(ShippingOptionWithLocation)
        // {
        //     trigger OnAfterValidate()
        //     var
        //         compRec: Record "Company Information";
        //     begin
        //         compRec.Get;
        //         if ShipToOptions = ShipToOptions::"Default (Company Address)" then begin
        //             "Ship-to Name" := compRec.Name;
        //             "Ship-to Address" := compRec.Address;
        //             "Ship-to Address 2" := compRec."Address 2";
        //             "Ship-to City" := compRec.City;
        //             "Ship-to Post Code" := compRec."Post Code";
        //             "Ship-to Country/Region Code" := compRec."Country/Region Code";
        //             "Ship-to Contact" := compRec."Contact Person";
        //         end;
        //     end;
        // }
    }

    actions
    {
        addafter("Create Inventor&y Put-away/Pick")
        {
            action("Purchase Order-Local")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    purchHead: Record "Purchase Header";
                begin
                    purchHead.Reset();
                    purchHead.SetRange("Document Type", "Document Type");
                    purchHead.SetRange("No.", "No.");
                    Report.RunModal(50403, true, true, purchHead);
                end;
            }
            action("Purchase Order-Imports")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    purchHead: Record "Purchase Header";
                begin
                    purchHead.Reset();
                    purchHead.SetRange("Document Type", "Document Type");
                    purchHead.SetRange("No.", "No.");
                    Report.RunModal(50404, true, true, purchHead);
                end;
            }
            action("Material Loan In")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    purchHead: Record "Purchase Header";
                begin
                    purchHead.Reset();
                    purchHead.SetRange("Document Type", "Document Type");
                    purchHead.SetRange("No.", "No.");
                    Report.RunModal(50421, true, true, purchHead);
                end;
            }
            action("Prepayment Approval Sheet")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    purchHead: Record "Purchase Header";
                begin
                    purchHead.Reset();
                    purchHead.SetRange("Document Type", "Document Type");
                    purchHead.SetRange("No.", "No.");
                    purchHead.SetRange("Buy-from Vendor No.", "Buy-from Vendor No.");
                    Report.RunModal(50437, true, true, purchHead);
                end;
            }
        }
    }


}