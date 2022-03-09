report 50420 "Material Loan Out"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-I-013_MaterialLoanOut.rdl';


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(No_; "No.")
            { }
            column(Document_Date; "Document Date")
            { }
            column(External_Document_No_; "External Document No.")
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
            column(Buy_from_Post_Code; "Sell-to Post Code")
            { }
            column(Buy_from_Contact_No_; "Sell-to Contact No.")
            { }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document No." = field("No.");

                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(Unit_of_Measure; "Unit of Measure")
                { }
                column(compRecName; compRec.Name)
                { }
                column(Logo; compRec.Picture)
                { }
                column(compRecAddress1; compRec.Address)
                { }
                column(compRecAddress2; compRec."Address 2")
                { }
                column(city; compRec.City)
                { }
                column(sellToCountry; sellToCountry.Name)
                { }
                column(comCountry; comCountry.Name)
                { }
                trigger OnAfterGetRecord()
                begin
                    compRec.Get;
                    compRec.CalcFields(Picture);
                    if comCountry.Get(compRec."Country/Region Code") then;
                    if sellToCountry.Get("Sales Header"."Sell-to Country/Region Code") then;
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
        compRec: Record "Company Information";
        comCountry: Record "Country/Region";
        sellToCountry: Record "Country/Region";

}