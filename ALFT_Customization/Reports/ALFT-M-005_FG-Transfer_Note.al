report 50412 "FG-Transfer Note"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-M-005_FG-TarnsferNote.rdl';

    dataset
    {
        dataitem("Transfer Line"; "Transfer Line")
        {
            column(Item_No_; "Item No.")
            { }
            column(Description; Description)
            { }
            column(Unit_of_Measure; "Unit of Measure")
            { }
            column(Quantity; Quantity)
            { }
            column(Remarks; Remarks)
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
            column(Inx; Inx)
            { }
            column(Logo; compRec.Picture)
            { }
            trigger OnAfterGetRecord()
            begin
                compRec.Get;
                compRec.CalcFields(Picture);
                transHead.Get("Document No.");
                Inx += 1;
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
        transHead: Record "Transfer Header";
        compRec: Record "Company Information";
        Inx: Integer;
}