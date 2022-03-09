report 50425 "Return Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-S-004_ReturnReport.rdl';

    dataset
    {
        dataitem("Return Receipt Header"; "Return Receipt Header")
        {
            column(Document_Date; "Posting Date")
            { }
            column(No_; "External Document No.")
            { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            { }
            column(Return_Receipt_No_; "No.")
            { }
            dataitem("Return Receipt Line"; "Return Receipt Line")
            {
                DataItemLinkReference = "Return Receipt Header";
                DataItemLink = "Document No." = field("No.");
                column(Description; Description)
                { }
                column(Unit_Price; "Unit Price")
                { }
                column(Unit_of_Measure; "Unit of Measure")
                { }
                column(Currency_Code; "Currency Code")
                { }
                column(Quantity; Quantity)
                { }
                column(customerItemCode; item."Customer Item Code")
                { }
                column(no2; item."No. 2")
                { }
                column(invoNo; invoNum)
                { }

                trigger OnAfterGetRecord()
                begin
                    if Type <> Type::Item then begin
                        CurrReport.Skip();
                    end;

                    if Type = Type::Item then begin
                        if item.Get("No.") then;
                    end;
                    if "Currency Code" = '' then
                        "Currency Code" := 'LKR';





                end;
            }
            trigger OnAfterGetRecord()
            begin
                crMemo.Reset();
                crMemo.SetRange("Return Order No.", "Return Order No.");
                if crMemo.Find() then
                    invoNum := crMemo."Applies-to Doc. No.";
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
        purchInv: Record "Purch. Inv. Header";
        item: Record Item;
        crMemo: Record "Sales Cr.Memo Header";
        invoNum: Text;
}