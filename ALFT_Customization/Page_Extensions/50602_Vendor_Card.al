pageextension 50602 VendorCardExt extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            field("Avg. Vendor Delivery Time"; "Avg. Vendor Delivery Time")
            {
                ApplicationArea = All;
                Caption = 'Average Vendor Delivery Time';
            }
            field("Quality of the Service"; "Quality of the Service")
            {
                ApplicationArea = All;
            }
            field("Product Quality"; "Product Quality")
            {
                ApplicationArea = All;
            }
        }
        addafter("E-Mail")
        {
            field("E-mail 2"; "E-mail 2")
            {
                ApplicationArea = All;
            }
            field("E-mail 3"; "E-mail 3")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}