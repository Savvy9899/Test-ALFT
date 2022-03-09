pageextension 50621 TransferOrderSub extends "Transfer Order Subform"
{
    layout
    {
        addafter("Receipt Date")
        {
            field(Remarks; Remarks)
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Current Inventory"; "Current Inventory")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnModifyRecord(): Boolean
    var
        tranHead: Record "Transfer Header";
    begin
        tranHead.Get("Document No.");
        if tranHead."Prod. Ord. No." <> '' then
            CurrPage.Editable(false);

    end;
}