pageextension 50601 ItemList extends "Item List"
{
    layout
    {
        addafter("Routing No.")
        {
            field("HS Code"; "HS Code")
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