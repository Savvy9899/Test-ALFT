report 50422 "Customer PO"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-S-001-CustomerPO.rdl';

    dataset
    {
        dataitem("Sales Line"; "Sales Line")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Order));
            column(No_; salesHead."No.")
            { }
            column(Document_Date; salesHead."Document Date")
            { }
            column(Order_Type; "Sales Order Type")
            { }
            column(Sell_to_Customer_Name; salesHead."Sell-to Customer Name")
            { }
            column(External_Document_No_; salesHead."External Document No.")
            { }
            column("ProdOrdNo"; salesHead."Prod. Ord. No.")
            { }
            column(prodDes; prodDes)
            { }
            column(Customer_Item_Code; "Customer Item Code")
            { }
            column(Shipment_Date; "Requested Delivery Date")
            { }
            column(Quantity; Quantity)
            { }
            column(Unit_Price; "Unit Price")
            { }
            column(Unit_of_Measure; "Unit of Measure")
            { }
            column(Quantity_Invoiced; "Quantity Invoiced")
            { }
            column(No__2; "No. 2")
            { }
            column(OurProductCode; "No. 2")
            { }
            column(materialComb; materialComb)
            { }
            column(productType; priceRec.Type)
            { }
            column(reelWidth; priceRec."Reel Width (mm)")
            { }
            column(COL; priceRec."COL (mm)")
            { }
            column(bagWidth; priceRec."Bag Width (mm)")
            { }
            column(bagLenght; priceRec."Bag Length (mm)")
            { }
            column(CSeal; priceRec."Seal Type")
            { }
            column(gusset1; priceRec."Gusset (Full)")
            { }
            column(Currency_Code; "Currency Code")
            { }
            column(Line_Amount; "Line Amount")
            { }

            column(POAmount; POAmount)
            { }
            trigger OnAfterGetRecord()
            begin
                salesHead.Get("Document Type", "Document No.");
                currency := 'LKR';

                if "Sales Order Type" = "Sales Order Type"::"Cyl. Discount" then begin
                    CurrReport.Skip();
                end;

                prodOrder.Reset();
                prodOrder.SetRange("No.", salesHead."Prod. Ord. No.");
                if prodOrder.FindSet() then
                    prodDes := prodOrder.Description;

                if Type = Type::Item then begin
                    if item.Get("No.") then;
                    if item.Get(item."PR Item No.") then;
                    if priceRec.Get(item."Price Request Form No.") then;
                    materialComb := priceRec."Material Comb. Film 01" + '|' + priceRec."Material Comb. Film 02" + '|' + priceRec."Material Comb. Film 03" + '|' + priceRec."Material Comb. Ldp 01" + '|' + priceRec."Material Comb. Ldp 02";
                end;

                salesHead.CalcFields(Amount);
                POAmount := salesHead.Amount;

                if "Currency Code" = '' then begin
                    "Currency Code" := currency;
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
        salesHead: Record "Sales Header";
        prodOrder: Record "Production Order";
        prodDes: Text;
        item: Record Item;
        priceRec: Record "Price Request Form";
        materialComb: Text;
        purchOrder: Record "Purchase Header";
        POAmount: Decimal;
        currency: Text;
}