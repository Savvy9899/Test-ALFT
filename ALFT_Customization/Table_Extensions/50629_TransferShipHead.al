tableextension 50629 TransShiphead extends "Transfer Shipment Header"
{
    fields
    {
        field(50005; "Prod. Ord. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Production Order"."No." where(Status = filter(Released));
        }
    }

    var
        myInt: Integer;
}