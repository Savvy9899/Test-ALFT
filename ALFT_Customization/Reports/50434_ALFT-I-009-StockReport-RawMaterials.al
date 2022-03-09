report 50434 "Stock Report-RawMaterial"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-I-009-StockReport-Raw Material.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = where("Document Type" = filter("Purchase Receipt"));
            column(Entry_No_; "Entry No.")
            { }
            column(Remaining_Quantity; "Remaining Quantity")
            { }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            { }
            column(Description; Description)
            { }
            column(itemCategory; item."ALFT Product Group Code")
            { }
            column(itemUnitPrice; item."Unit Price")
            { }
            column(age; ABS(age))
            { }
            column(stDate; stDate)
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(values; values)
            { }
            trigger OnAfterGetRecord()

            begin
                item.Get("Item No.");
                CalcFields("Cost Amount (Actual)");
                CalcFields("Cost Amount (Expected)");
                values := "Cost Amount (Expected)" + "Cost Amount (Actual)";
                unitPrice := values / Quantity;

                age := stDate - eDate;

            end;

            trigger OnPreDataItem()
            begin
                eDate := System.Today();
                SetRange("Posting Date", stDate, eDate);

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
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        stDate: Date;
        eDate: Date;
        item: Record Item;
        values: Decimal;
        unitPrice: Decimal;
        age: Decimal;

}