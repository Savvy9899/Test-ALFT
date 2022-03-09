pageextension 50631 TransferOrderList extends "Transfer Orders"
{
    layout
    {
        addafter("Direct Transfer")
        {
            field(Synchronized; Synchronized)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    { }
    trigger OnOpenPage()

    begin
        SetFilter("Transfer Order Type", '%1|%2', "Transfer Order Type"::Return, "Transfer Order Type"::Transfer);
    end;
}