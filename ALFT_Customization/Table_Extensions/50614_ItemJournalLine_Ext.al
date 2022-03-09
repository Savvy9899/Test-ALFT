tableextension 50614 ItemJournalLine extends "Item Journal Line"
{
    fields
    {
        field(50005; "Prod. Ord. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Production Order"."No." where(Status = filter(Released));
        }
        field(50007; "Trans. Ord. Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

}