report 50423 "GRN Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-P-007_GRN_Report.rdl';

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            column(No_; "No.")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Order_No_; "Order No.")
            { }
            column(L_C_No_; "L/C No.")
            { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            { }
            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            { }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLinkReference = "Purch. Rcpt. Header";
                DataItemLink = "Document No." = field("No.");
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(vendorInvNo; vendorInvNo)
                { }

                trigger OnAfterGetRecord()
                begin
                    purchHead.Reset();
                    purchHead.SetRange("No.", "Purch. Rcpt. Header"."Order No.");
                    if purchHead.FindFirst() then
                        vendorInvNo := purchHead."Vendor Invoice No.";

                    if Type <> Type::Item then begin
                        CurrReport.Skip();
                    end;


                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                { }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        purchHead: Record "Purchase Header";
        vendorInvNo: Text;
}