report 50414 "Material_Requision Issue Note"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-M-016_Material_Requision_IssueNote.rdl';

    dataset
    {
        dataitem("Transfer Header"; "Transfer Header")
        {
            dataitem("Transfer Line"; "Transfer Line")
            {
                DataItemLinkReference = "Transfer Header";
                DataItemLink = "Document No." = field("No.");
                column(Item_No_; "Item No.")
                { }
                column(Description; Description)
                { }
                column(Unit_of_Measure; "Unit of Measure")
                { }
                column(Logo; compRec.Picture)
                { }
                column(fromLocation; transHead."Transfer-from Name")
                { }
                column(toLocation; transHead."Transfer-to Name")
                { }
                column(postingDate; transHead."Posting Date")
                { }
                column(prodOrderNo; transHead."Prod. Ord. No.")
                { }
                column(NO; transHead."No.")
                { }

                trigger OnAfterGetRecord()
                begin
                    compRec.Get;
                    compRec.CalcFields(Picture);
                    transHead.Get("Document No.");
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
        transHead: Record "Transfer Header";
}