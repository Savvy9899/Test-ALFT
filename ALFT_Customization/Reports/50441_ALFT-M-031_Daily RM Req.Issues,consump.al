report 50441 "Daily RM Req. Issue & Consump"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Daily RM Req. Issue & Consumption';
    RDLCLayout = 'Report_Layouts/ALFT-M-031_Daily RM Req. Issue & Consump.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            column(Entry_No_; "Entry No.")
            { }
            column(Item_No_; "Item No.")
            { }
            column(itemDescription; item.Description)
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Prod__Ord__No_; "Prod. Ord. No.")
            { }
            column(Document_No_; "Document No.")
            { }
            column(Trans__Ord__Qty; "Trans. Ord. Qty")
            { }

            trigger OnAfterGetRecord()
            begin
                item.Get("Item No.");
            end;

            trigger OnPreDataItem()
            begin
                item.Get("Item No.");
                if item."Inventory Posting Group" <> 'RM' then
                    CurrReport.Skip();
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
            }
        }
    }

    var
        item: Record Item;
}