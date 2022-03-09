pageextension 50618 "Purchase&PaySetup" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Vendor Nos.")
        {
            field("Purchase Req. Nos."; "Purchase Req. Nos.")
            {
                ApplicationArea = All;
            }
            field("Service Req. Nos."; "Service Req. Nos.")
            {
                ApplicationArea = All;
            }
        }
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