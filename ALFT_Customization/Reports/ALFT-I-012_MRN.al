report 50419 MRN
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-I-012_MRN.rdl';

    dataset
    {
        dataitem("Transfer Header"; "Transfer Header")
        {
            column(No_; "No.")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Prod__Ord__No_; "Prod. Ord. No.")
            { }
            column(Transfer_to_Code; "Transfer-to Code")
            { }
            dataitem("Transfer Line"; "Transfer Line")
            {
                DataItemLinkReference = "Transfer Header";
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
                column(comCountry; comCountry.Name)
                { }
                trigger OnAfterGetRecord()
                begin
                    compRec.Get;
                    compRec.CalcFields(Picture);
                    if comCountry.Get(compRec."Country/Region Code") then;
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
}