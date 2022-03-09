report 50421 "Material Loan In"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-I-014_MaterialLoanIn.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
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
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLinkReference = "Purchase Header";
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");

                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(Unit_of_Measure; "Unit of Measure")
                { }
                column(sellToCountry; venCom.Name)
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
                column(Logo; comRec.Picture)
                { }
                trigger OnAfterGetRecord()
                begin
                    venCom.Get("Purchase Header"."Buy-from Country/Region Code");
                    comRec.Get;
                    comRec.CalcFields(Picture);
                    comCountry.Get(comRec."Country/Region Code");
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