tableextension 50628 "ItemLedgerExt" extends "Item Ledger Entry"
{
    fields
    {
        field(50005; "Prod. Ord. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Production Order"."No." where(Status = filter(Released));
        }
        field(50006; "Trans. Ord. Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}