report 50416 ReturnNote
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-I-003_ReturnNote.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(No_; "No.")
            { }
            column(Sell_to_Customer_No_; "Buy-from Vendor No.")
            { }
            column(Sell_to_Customer_Name; "Buy-from Vendor Name")
            { }
            column(Sell_to_Address; "Buy-from Address")
            { }
            column(Sell_to_Address_2; "Buy-from Address 2")
            { }
            column(Sell_to_City; "Buy-from City")
            { }
            column(Document_Date; "Document Date")
            { }
            column(sellToCountry; SellToCoun.Name)
            { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLinkReference = "Purchase Header";
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
                trigger OnAfterGetRecord()
                begin
                    comRec.Get;
                    comRec.CalcFields(Picture);
                    if comCountry.Get(comRec."Country/Region Code") then;
                    if SellToCoun.Get("Purchase Header"."Buy-from Country/Region Code") then;

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
        SellToCoun: Record "Country/Region";
        comCountry: Record "Country/Region";

}