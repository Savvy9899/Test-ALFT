tableextension 50625 "TransferReceiptLine" extends "Transfer Receipt Line"
{
    fields
    {
        field(50000; "Quantity Shipped"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Current Inventory"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Transfer Order Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",MRN;
            OptionCaption = ' ,MRN';
        }
        field(50005; "Prod. Ord. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Production Order"."No." where(Status = filter(Released));
        }

    }

    var
        myInt: Integer;
}