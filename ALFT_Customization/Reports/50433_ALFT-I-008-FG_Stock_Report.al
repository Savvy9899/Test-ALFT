report 50433 "FG Stock Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-I-008-FG_Stock_Report.rdl';


    dataset
    {
        dataitem("Transfer Receipt Header"; "Transfer Receipt Header")
        {
            column(No_; "No.")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(edDate; edDate)
            { }
            dataitem("Transfer Receipt Line"; "Transfer Receipt Line")
            {
                DataItemLinkReference = "Transfer Receipt Header";
                DataItemLink = "Document No." = field("No.");

                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(unitprice; item."Unit Price")
                { }
                column(Unit_of_Measure; "Unit of Measure")
                { }
                column(amount; amount)
                { }
                column(age; age)
                { }
                column(cusName; cusName)
                { }

                trigger OnAfterGetRecord()
                begin
                    cusName := '';

                    item.Get("Item No.");
                    amount := Quantity * item."Unit Price";
                    age := edDate - stDate;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                prdOrd.Reset();
                prdOrd.SetRange("No.", "Transfer Receipt Header"."Prod. Ord. No.");
                if prdOrd.Find() then
                    cusName := prdOrd."Customer Name";
            end;

            trigger OnPreDataItem()
            begin
                edDate := System.Today();
                SetRange("Posting Date", stDate, edDate);

                if stDate = 0D then
                    Error('Date field should have a value');
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
                {
                    field(stDate; stDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Date';
                    }
                }
            }
        }

        actions
        {
            area(processing)
            { }
        }
    }

    var
        item: Record Item;
        amount: Decimal;
        stDate: Date;
        edDate: Date;
        age: Decimal;
        prdOrd: Record "Production Order";
        cusName: Text;

}