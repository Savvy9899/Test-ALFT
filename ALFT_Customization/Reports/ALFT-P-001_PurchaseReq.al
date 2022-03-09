report 50402 "Purchase Requisition"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-P-001_Purchase_Req.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(No_; "No.")
            { }
            column(Due_Date; "Required Before")
            { }
            column(Posting_Date; "Document Date")
            { }
            column(Purchase_Requisition_No_; "Purchase Requisition No.")
            { }
            column(dimVal; dim."Dimension Value Name")
            { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLinkReference = "Purchase Header";
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                column(ItemNo; "No.")
                { }
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(Unit_of_Measure; "Unit of Measure")
                { }
                column(companyName; comRec.Name)
                { }
                column(unitPrice; item."Last Direct Cost")
                { }
                column(stock; item.Inventory)
                { }

                trigger OnAfterGetRecord()
                begin
                    comRec.Get;
                    if Type = Type::Item then begin
                        if item.Get("No.") then;
                        item.CalcFields(Inventory);
                    end;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                dim.Get("Dimension Set ID", 'DEP');
                dim.CalcFields("Dimension Value Name");
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
        dim: Record "Dimension Set Entry";
        item: Record Item;
        dimVal: Text[50];
        no: Integer;
}