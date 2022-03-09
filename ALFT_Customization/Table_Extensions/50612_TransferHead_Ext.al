tableextension 50612 TransferHeader extends "Transfer Header"
{
    fields
    {
        field(50000; "Transfer Order Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = MRN,Transfer,Return;
            OptionCaption = 'MRN,Transfer,Return';
        }
        field(50001; "Prod. Ord. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Production Order"."No." where(Status = filter(Released));

            trigger OnValidate()
            var
                prodOrder: Record "Production Order";
            begin
                if prodOrder.Get(prodOrder.Status::Released, "Prod. Ord. No.") then
                    "Prod. Ord. Description" := prodOrder.Description;
            end;
        }
        field(50002; "Prod. Ord. Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Prod. Order Line"."Line No." where("Prod. Order No." = field("Prod. Ord. No."));
        }
        field(50003; "Prod. Ord. Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Qty. To Ship"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Transfer Line"."Qty. to Ship" where("Document No." = field("No.")));
        }
        field(50005; "Qty. To Receive"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Transfer Line"."Qty. to Receive" where("Document No." = field("No.")));
        }
        field(50006; Synchronized; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        myInt: Integer;
}