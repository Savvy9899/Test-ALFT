pageextension 50620 SalesRecSetup extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Material Loan In Nos."; "Material Loan In Nos.")
            {
                ApplicationArea = All;
            }
            field("Material Loan Out Nos."; "Material Loan Out Nos.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}