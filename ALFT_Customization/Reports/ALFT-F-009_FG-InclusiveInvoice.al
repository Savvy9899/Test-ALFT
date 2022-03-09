report 50407 "FG-Inclusive Invoice"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-F-009_InclusiveInvoice.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            column(No_; "No.")
            { }
            column(Posting_Date; "Posting Date")
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
            column(External_Document_No_; "External Document No.")
            { }
            column(AOD_No_; "AOD No.")
            { }
            column(Prod__Ord__No_; "Prod. Ord. No.")
            { }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLinkReference = "Sales Invoice Header";
                DataItemLink = "Document No." = field("No.");
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(Unit_Cost; "Unit Price")
                { }
                column(Unit_of_Measure; "Unit of Measure")
                { }
                column(Line_Amount; "Line Amount")
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
                column(comRec; comRec."NBT Registration No.")
                { }
                column(web; comRec."Home Page")
                { }
                column(vatComp; comRec."VAT Registration No.")
                { }
                column(sellToCountry; sellToCountry.Name)
                { }
                column(payT; payT.Description)
                { }
                column(cusVatRegNo; cusRec."VAT Registration No.")
                { }
                column(NBT; cusRec."NBT Registration No.")
                { }
                column(cusItem; cusItem)
                { }

                trigger OnAfterGetRecord()
                begin
                    cusItem := '';

                    comRec.Get;
                    comRec.CalcFields(Picture);
                    cusRec.Get("Sell-to Customer No.");

                    if comCountry.Get(comRec."Country/Region Code") then;
                    if sellToCountry.Get("Sales Invoice Header"."Sell-to Country/Region Code") then;
                    if payT.Get("Sales Invoice Header"."Payment Terms Code") then;

                    if Type = Type::Item then begin
                        item.Get("No.");
                        cusItem := item."Customer Item Code";
                    end;
                end;
            }
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
        comRec: Record "Company Information";
        comCountry: Record "Country/Region";
        sellToCountry: Record "Country/Region";
        cusRec: Record Customer;
        payT: Record "Payment Terms";
        item: Record Item;
        cusItem: Text;
}