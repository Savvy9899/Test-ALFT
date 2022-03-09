pageextension 50604 CustomerCard extends "Customer Card"
{
    layout
    {
        addafter("Document Sending Profile")
        {
            field("Customer Classification"; "Customer Classification")
            {
                ApplicationArea = All;
            }
            field("Customer's Line of Bus."; "Customer's Line of Bus.")
            {
                ApplicationArea = All;
            }
            field(Segment; Segment)
            {
                ApplicationArea = All;
            }
            field("Commisions Groups"; "Commisions Groups")
            {
                ApplicationArea = All;
            }
            field("Customers Sales Group"; "Customers Sales Group")
            {
                ApplicationArea = All;
            }

        }
        addafter("VAT Registration No.")
        {
            field("NBT Registration No."; "NBT Registration No.")
            {
                ApplicationArea = All;
            }
            field("SVAT Registration No."; "SVAT Registration No.")
            {
                ApplicationArea = All;
            }
            field("TIN No."; "TIN No.")
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
    { }

    var
        myInt: Integer;
}