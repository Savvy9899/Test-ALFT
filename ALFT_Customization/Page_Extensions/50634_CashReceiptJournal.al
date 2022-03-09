pageextension 50634 CashReceiptJournal extends "Cash Receipt Journal"
{
    layout
    {
        modify("Bal. Account No.")
        {
            trigger OnAfterValidate()
            var
                cusRec: Record Customer;
            begin
                if "Bal. Account Type" = "Bal. Account Type"::Customer then begin
                    cusRec.Get("Bal. Account No.");
                    Description := cusRec.Name;
                end;
            end;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}