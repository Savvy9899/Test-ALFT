pageextension 50412 InvenSetupPage extends "Inventory Setup"
{
    layout
    {
        addlast(Numbering)
        {
            field("MRN Nos."; "MRN Nos.")
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