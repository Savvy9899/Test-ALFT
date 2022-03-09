report 50424 "Invoice Report-(Item Wise)"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-S-003_InvoiceReport(Item Wise).rdl';


    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            column(No_; "No.")
            { }
            column(Posting_Date; saleHead."Document Date")
            { }
            column(sellToCustomer; saleHead."Sell-to Customer Name")
            { }
            column(Description; Description)
            { }
            column(Document_No_; saleHead."External Document No.")
            { }
            column(salesP; salesP.Name)
            { }
            column(JobNo; saleHead."Prod. Ord. No.")
            { }
            column(Shipment_Date; postingDate)
            { }
            column(Quantity_Invoiced; Quantity)
            { }
            column(Unit_Price; "Unit Price")
            { }
            column(invoiceNO; saleHead."No.")
            { }
            column(cusItem; cusItem)
            { }
            trigger OnAfterGetRecord()
            begin
                postingDate := 0D;

                saleHead.Get("Document No.");
                salesP.Get(saleHead."Salesperson Code");

                if shipHead.Get(saleHead."AOD No.") then;
                postingDate := shipHead."Posting Date";

                if Type = Type::Item then begin
                    if item.Get("No.") then;
                    cusItem := item."Customer Item Code";
                end;
            end;


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
        saleHead: Record "Sales Invoice Header";
        salesP: Record "Salesperson/Purchaser";
        item: Record Item;
        cusItem: Text;
        shipHead: Record "Sales Shipment Header";
        postingDate: Date;
}