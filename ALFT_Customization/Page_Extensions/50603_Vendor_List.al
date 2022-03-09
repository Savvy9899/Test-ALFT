pageextension 50603 VendorList extends "Vendor List"
{
    layout
    {
        addafter("Search Name")
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
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}