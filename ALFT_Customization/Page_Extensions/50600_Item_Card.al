pageextension 50600 ItemCard extends "Item Card"
{
    layout
    {
        addafter("Purchasing Code")
        {
            field("HS Code"; "HS Code")
            {
                ApplicationArea = All;
            }
            field("Our Product Code"; "Our Product Code")
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