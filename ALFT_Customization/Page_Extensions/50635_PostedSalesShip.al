pageextension 50635 PostedSalesShipment extends "Posted Sales Shpt. Subform"
{
    layout
    {
    }

    actions
    {
        modify(UndoShipment)
        {
            Visible = false;
        }
    }


    var
        myInt: Integer;
}