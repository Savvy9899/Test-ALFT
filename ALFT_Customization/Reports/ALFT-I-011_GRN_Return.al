report 50418 "GRN Return"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-I-011_GRN_Return.rdl';

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            column(No_; "No.")
            { }
            column(Document_Date; "Document Date")
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
            column(Buy_from_Post_Code; "Buy-from Post Code")
            { }
            column(Buy_from_Contact_No_; "Buy-from Contact No.")
            { }
            column(L_C_No_; "L/C No.")
            { }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLinkReference = "Purch. Rcpt. Header";
                DataItemLink = "Document No." = field("No.");

                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(venCom; venCom.Name)
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
                    if venCom.Get("Purch. Rcpt. Header"."Buy-from Country/Region Code") then;
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
        venCom: Record "Country/Region";
        comRec: Record "Company Information";
        comCountry: Record "Country/Region";
}
