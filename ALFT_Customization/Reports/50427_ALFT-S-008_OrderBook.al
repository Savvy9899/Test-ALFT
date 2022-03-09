report 50427 "Order Book"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-S-008_OrderBook.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            { }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            { }
            column(Salesperson_Code; "Salesperson Code")
            { }
            column(salesPer; salesPer.Name)
            { }
            column(preAount; preAount)
            { }
            column(CurrentAmount; CurrentAmount)
            { }
            trigger OnAfterGetRecord()
            var
                salesHead: Record "Sales Header";

            begin
                CurrentAmount := 0;
                preAount := 0;
                if salesPer.Get("Salesperson Code") then;

                salesHead.Reset();
                salesHead.SetRange("Document Type", "Document Type");
                salesHead.SetRange("No.", "No.");
                salesHead.SetRange("Sell-to Customer No.", "Sell-to Customer No.");
                salesHead.SetRange("Salesperson Code", "Salesperson Code");
                salesHead.SetFilter("Posting Date", '%1..%2', sDate, eDate);
                salesHead.CalcFields("Amount Including VAT");
                CurrentAmount := salesHead."Amount Including VAT";


                preSdate := CalcDate('CM-2M+1D', sDate);
                preEdate := CalcDate('CM', CalcDate('-CM-1D', eDate));

                salesHead1.Reset();
                salesHead1.SetRange("Document Type", "Document Type");
                salesHead1.SetRange("No.", "No.");
                salesHead1.SetRange("Sell-to Customer No.", "Sell-to Customer No.");
                salesHead1.SetRange("Salesperson Code", "Salesperson Code");
                salesHead1.SetFilter("Posting Date", '%1..%2', preSdate, preEdate);
                salesHead1.CalcFields("Amount Including VAT");
                preAount := salesHead1."Amount Including VAT";

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
                    field(sDate; sDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                        trigger OnValidate()
                        begin
                            if sDate <> CalcDate('-CM', sDate) then
                                Error('Start date should be the first date of month');
                        end;
                    }
                    field(eDate; eDate)
                    {
                        ApplicationArea = All;
                        Caption = 'End Date';
                        trigger OnValidate()
                        begin
                            if eDate <> CalcDate('CM', eDate) then
                                Error('End date should be the last date of month');
                        end;
                    }
                }
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
        salesPer: Record "Salesperson/Purchaser";
        sDate: Date;
        eDate: Date;
        preSdate: Date;
        preEdate: Date;
        CurrentAmount: Decimal;
        preAount: Decimal;
        salesHead1: Record "Sales Header";
}