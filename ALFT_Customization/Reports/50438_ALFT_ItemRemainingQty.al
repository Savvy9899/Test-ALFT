report 50438 "ItemRemainingQty"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT_ItemRemainingQty.rdl';
    Caption = 'Item Remaining Quantity Report';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = where("Entry Type" = filter('Transfer'), "Document Type" = filter('Transfer Receipt'));

            column(Item_No_; "Item No.")
            { }
            column(Description; Description)
            { }
            column(Remaining_Quantity; "Remaining Quantity")
            { }
            column(Entry_Type; "Entry Type")
            { }
            column(Document_Type; "Document Type")
            { }
            column(Posting_Date; "Posting Date")
            { }

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
        myInt: Integer;
}