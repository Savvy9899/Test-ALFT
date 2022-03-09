report 50432 "Nestle Delivery Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-I-006-NestleDelivery.rdl';

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            column(No_; "No.")
            { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            { }
            column(Prod__Ord__No_; "Prod. Ord. No.")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Promised_Delivery_Date; "Promised Delivery Date")
            { }
            column(Vehicle_No_; "Vehicle No.")
            { }
            column(Posting_Date; "Posting Date")
            { }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLinkReference = "Sales Shipment Header";
                DataItemLink = "Document No." = field("No.");

                column(ItemNo; "No.")
                { }
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }

                trigger OnAfterGetRecord()
                begin
                    "Sales Shipment Line".CalcSums(Quantity);
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
        qty: Decimal;
}