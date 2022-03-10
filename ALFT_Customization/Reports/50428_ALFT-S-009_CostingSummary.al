report 50428 "Costing Summary - ALFT"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-S-009_CostingSummary.rdl';

    dataset
    {
        dataitem("Sales Line"; "Sales Line")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Order));
            column(No_; priceRec."No.")
            { }
            column(priceRecFormDate; priceRec."Document Date")
            { }
            column(Description; Description)
            { }
            column(quoteNo; saleHead."Quote No.")
            { }
            column(salePer; salePer.Name)
            { }
            column(Customer; saleHead."Sell-to Customer Name")
            { }
            column(materialComb; materialComb)
            { }
            column(priceRecType; priceRec.Type)
            { }
            column(uom; priceRec.UOM)
            { }
            column(MOQ; priceRec."Moq.")
            { }
            column(Unit_Price; "Unit Price")
            { }
            column(confirmation; saleHead.Confirmation)
            { }
            column(Amount; saleHead."Amount Including VAT")
            { }
            column(docDate; saleHead."Document Date")
            { }
            column(costComp; costComp)
            { }
            column(itemNo; item."No.")
            { }

            trigger OnAfterGetRecord()
            begin
                saleHead.Get("Document Type", "Document No.");
                if salePer.Get(saleHead."Salesperson Code") then;
                saleHead.CalcFields("Amount Including VAT");

                if Type = Type::Item then begin
                    if item.Get("No.") then;
                    if priceRec.Get(item."Price Request Form No.") then;
                    materialComb := priceRec."Material Comb. Film 01" + '|' + priceRec."Material Comb. Film 02" + '|' + priceRec."Material Comb. Film 03" + '|' + priceRec."Material Comb. Ldp 01" + '|' + priceRec."Material Comb. Ldp 02";

                    if priceRec."Costing Completed" = true then
                        costComp := 'Yes'
                    else
                        costComp := 'No';

                end;
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
        saleHead: Record "Sales Header";
        salePer: Record "Salesperson/Purchaser";
        item: Record Item;
        priceRec: Record "Price Request Form";
        materialComb: Text;
        costComp: Text;
}