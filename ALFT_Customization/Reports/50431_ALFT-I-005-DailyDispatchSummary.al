report 50431 "Daily Dispatch Summary Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-I-005-DailyDispatchSummary.rdl';

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            column(No_; "No.")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            { }
            column(AOD_No_; "AOD No.")
            { }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLinkReference = "Sales Shipment Header";
                DataItemLink = "Document No." = field("No.");
                column(no; no)
                { }
                column(Quantity; Quantity)
                { }
                column(Unit_of_Measure; "Unit of Measure")
                { }
                column(description; description)
                { }
                trigger OnAfterGetRecord()
                begin
                    no := 0;

                    no += 1;
                    description := Description + ' ' + Description;
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
        no: Integer;
        description: Text;
}