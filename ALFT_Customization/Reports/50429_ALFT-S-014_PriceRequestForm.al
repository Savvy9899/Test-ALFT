report 50429 "Price Request Form Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-S-014_PriceRequestFormReport.rdl';

    dataset
    {
        dataitem("Price Request Form"; "Price Request Form")
        {
            column(No_; "No.")
            { }
            column(Customer_Name; "Customer Name")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Description; Description)
            { }
            column(Type; Type)
            { }
            column(Product; Product)
            { }
            column(Seal_Type; "Seal Type")
            { }
            column(Bag_Width__mm_; "Bag Width (mm)")
            { }
            column(Bag_Length__mm_; "Bag Length (mm)")
            { }
            column(Gusset__Full_; "Gusset (Full)")
            { }
            column(Bottom_Gusset__Full_; "Bottom Gusset (Full)")
            { }
            column(Zipper; Zipper)
            { }
            column(Moq_; "Moq.")
            { }
            column(Material_Combination; "Material Combination")
            { }
            column(Method_of_Printing; "Method of Printing")
            { }
            column(Reel_Width__mm_; "Reel Width (mm)")
            { }
            column(COL__mm_; "COL (mm)")
            { }
            column(Colours; Colours)
            { }
            column(No_of_Colors; "No of Colors")
            { }
            column(Remarks; Remarks)
            { }
            column(comRecName; comRec.Name)
            { }
            trigger OnAfterGetRecord()
            begin
                comRec.Get;
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
}