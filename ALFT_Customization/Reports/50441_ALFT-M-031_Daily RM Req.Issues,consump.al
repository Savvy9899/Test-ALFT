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
            column(reqQty; "Trans. Ord. Qty")
            { }
            column(issuedQty; issuedQty)
            { }
            column(consumed; consumed)
            { }

            trigger OnAfterGetRecord()
            begin
                item.Get("Item No.");
            end;

            trigger OnPreDataItem()
            begin
                if item.Get("Item No.") then;
                if item."Inventory Posting Group" <> 'RM' then
                    CurrReport.Skip();

                itemLed.Reset();
                itemLed.SetRange("Prod. Ord. No.", "Prod. Ord. No.");
                itemLed.SetRange("Entry Type", "Entry Type"::Transfer);
                itemLed.SetRange("Document Type", "Document Type"::"Transfer Shipment");
                itemLed.CalcFields(Quantity);
                issuedQty := Abs(itemLed.Quantity);

                itemLed.Reset();
                itemLed.SetRange("Prod. Ord. No.", "Prod. Ord. No.");
                itemLed.SetRange("Entry Type", "Entry Type"::Transfer);
                itemLed.SetRange("Document Type", "Document Type"::"Transfer Receipt");
                itemLed.CalcFields(Quantity);
                consumed := Abs(itemLed.Quantity);
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
        itemLed: Record "Item Ledger Entry";
        issuedQty: Decimal;
        consumed: Decimal;
        return: Decimal;
}