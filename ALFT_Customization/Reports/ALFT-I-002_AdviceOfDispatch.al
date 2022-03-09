report 50415 "Advice of Dispatch"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-I-002_AdviceOfDispatch.rdl';

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            column(No_; "No.")
            { }
            column(External_Document_No_; "External Document No.")
            { }
            column(Order_No_; "Order No.")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            { }
            column(Sell_to_Address; "Sell-to Address")
            { }
            column(Sell_to_Address_2; "Sell-to Address 2")
            { }
            column(Sell_to_City; "Sell-to City")
            { }
            column(sellToCountry; SellToCoun.Name)
            { }
            column(Vehicle_No_; "Vehicle No.")
            { }
            column(Driver_No_; "Driver No.")
            { }
            column(No_of_Reels_Boxes_Bundle; "No of Reels/Boxes/Bundle")
            { }
            column(Qty_per_Reels_Boxes_Bundle; "Qty per Reels/Boxes/Bundle")
            { }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLinkReference = "Sales Shipment Header";
                DataItemLink = "Document No." = field("No.");
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(comRecLogo; comRec.Picture)
                { }
                column(comRecName; comRec.Name)
                { }
                column(comRecAddress; comRec.Address)
                { }
                column(comRecAddress2; comRec."Address 2")
                { }
                column(comRecCity; comRec.City)
                { }
                column(comCountry; comCountry.Name)
                { }
                column(web; comRec."Home Page")
                { }
                column(prodNo; prodNo)
                { }
                column(title; title)
                { }
                column(title2; title2)
                { }
                column(cusItem; cusItem)
                { }

                trigger OnAfterGetRecord()
                begin
                    cusItem := '';

                    comRec.Get;
                    comRec.CalcFields(Picture);
                    if comCountry.Get(comRec."Country/Region Code") then;
                    if SellToCoun.Get("Sales Shipment Header"."Sell-to Country/Region Code") then;

                    prodOrd.Reset();
                    prodOrd.SetRange("Sales Order No.", "Sales Shipment Header"."Order No.");
                    if prodOrd.FindFirst() then
                        prodNo := prodOrd."No.";

                    if Type = Type::Item then begin
                        item.Get("No.");
                        cusItem := item."Customer Item Code";
                    end;
                end;
            }

            trigger OnPreDataItem()
            begin

                if noReel = true then begin
                    title := 'No of Reel';
                    title2 := 'Qty per Reel';
                end
                else
                    if noBags = true then begin
                        title := 'No of Bags';
                        title2 := 'Qty per Bag';
                    end
                    else
                        if bundle = true then begin
                            title := 'No of Bundle';
                            title2 := 'Qty per Bundle'
                        end
                        else
                            Error('Error');
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
                    field(noBags; noBags)
                    {
                        ApplicationArea = All;
                        Caption = 'Boxes';
                    }
                    field(noReel; noReel)
                    {
                        ApplicationArea = All;
                        Caption = 'Reels';
                    }
                    field(bundle; bundle)
                    {
                        ApplicationArea = All;
                        Caption = 'Bundle';
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
        comRec: Record "Company Information";
        comCountry: Record "Country/Region";
        SellToCoun: Record "Country/Region";
        prodOrd: Record "Production Order";
        item: Record Item;
        prodNo: Text;
        noReel: Boolean;
        noBags: Boolean;
        bundle: Boolean;
        title: Text;
        title2: Text;
        cusItem: Text;
}