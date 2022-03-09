report 50413 "Material Return Note"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-M-015_MaterialReturnNote.rdl';

    dataset
    {
        dataitem("Transfer Header"; "Transfer Header")
        {
            column(fromLocation; "Transfer-from Name")
            { }
            column(toLocation; "Transfer-to Name")
            { }
            column(postingDate; "Posting Date")
            { }
            column(prodOrderNo; "Prod. Ord. No.")
            { }
            column(NO; "No.")
            { }
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
                column(LotNo; LotNo)
                { }
                trigger OnAfterGetRecord()
                begin
                    compRec.Get;
                    compRec.CalcFields(Picture);
                    LotNo := '';

                    ResEntry.Reset();
                    ResEntry.SetRange("Source ID", "Document No.");
                    ResEntry.SetRange("Source Ref. No.", "Line No.");
                    ResEntry.SetRange(Positive, true);
                    if ResEntry.FindSet() then
                        repeat
                            LotNo := ResEntry."Lot No." + '/' + lotNo;
                        until ResEntry.Next() = 0;
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
        ResEntry: Record "Reservation Entry";
        LotNo: Text[150];
}