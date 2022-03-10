report 50442 "Daily FG and SFG Output"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-M-032_Daily FG and SFG Output.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            column(Entry_No_; "Entry No.")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Item_No_; "Item No.")
            { }
            column(Item_Category_Code; "Item Category Code")
            { }
            column(Prod__Ord__No_; "Prod. Ord. No.")
            { }
            column(Quantity; Abs(Quantity))
            { }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            { }
            column(Description; item.Description)
            { }
            column("Product_Group_Code"; item."ALFT Product Group Code")
            { }
            column(itemType; itemType)
            { }

            trigger OnAfterGetRecord()
            begin
                //@*-SFG
                item.Get("Item No.");
                if item."Inventory Posting Group" = 'SFG' then
                    itemType := 'SFG'
                else
                    if item."Inventory Posting Group" = 'FG' then
                        itemType := 'FG'
                    else
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
            { }
        }
    }
    var
        item: Record Item;
        itemType: Text;
}