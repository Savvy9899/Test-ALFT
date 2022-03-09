report 50410 "FG-Tax Credit_Note"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-F-012_FG-Tax Credit_Note.rdl';

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
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
            column(Pre_Assigned_No_; "Pre-Assigned No.")
            { }
            column(External_Document_No_; "External Document No.")
            { }
            column(Amount_Including_VAT; "Amount Including VAT")
            { }
            column(TaxAmount; TaxAmount)
            { }
            column(Amount; Amount)
            { }
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLinkReference = "Sales Cr.Memo Header";
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
                column(comRecNBT; comRec."NBT Registration No.")
                { }
                column(web; comRec."Home Page")
                { }
                column(vatComp; comRec."VAT Registration No.")
                { }
                column(SVATno; comRec."SVAT Registration No.")
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
                    if sellToCountry.Get("Sales Cr.Memo Header"."Sell-to Country/Region Code") then;
                    if payT.Get("Sales Cr.Memo Header"."Payment Terms Code") then;

                    if Type = Type::Item then begin
                        item.Get("No.");
                        cusItem := item."Customer Item Code";
                    end;
                end;
            }
            trigger OnAfterGetRecord()
            var
                comrec: Record "Company Information";
            begin
                CalcFields("Amount Including VAT");
                CalcFields(Amount);
                comrec.Get;
                TaxAmount := "Amount Including VAT" - Amount;

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
        comRec: Record "Company Information";
        comCountry: Record "Country/Region";
        sellToCountry: Record "Country/Region";
        cusRec: Record Customer;
        payT: Record "Payment Terms";
        TaxAmount: Decimal;
        TaxPer: Decimal;
        item: Record Item;
        cusItem: Text;
}