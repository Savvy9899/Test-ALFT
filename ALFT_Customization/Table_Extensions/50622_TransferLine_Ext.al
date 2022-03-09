tableextension 50622 Transferline extends "Transfer Line"
{
    fields
    {
        field(50000; Remarks; Text[200])
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
            OptionMembers = MRN,Transfer,Return;
            OptionCaption = 'MRN,Transfer,Return';
        }
        field(50005; "Prod. Ord. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Production Order"."No." where(Status = filter(Released));
        }
        modify("Item No.")
        {
            trigger OnAfterValidate()
            var
                TransHedd: Record "Transfer Header";
                item: Record Item;
            begin
                TransHedd.Get("Document No.");
                "Transfer Order Type" := TransHedd."Transfer Order Type";
                "Prod. Ord. No." := TransHedd."Prod. Ord. No.";

                item.Get("Item No.");
                item.CalcFields(Inventory);
                "Current Inventory" := item.Inventory;
            end;
        }
    }

    var
        myInt: Integer;
}