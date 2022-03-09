tableextension 50603 PurchaseLine extends "Purchase Line"
{
    fields
    {

        field(50001; "DEP-Checked"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                userSet: Record "User Setup";
            begin
                userSet.Get(UserId);
                if not userSet."DEP-Checked" = true then
                    Error('You do not have permission');
            end;
        }
        field(50002; "DO-Approved"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                userSet: Record "User Setup";
            begin
                userSet.Get(UserId);
                if not userSet."DO Approval" = true then
                    Error('You do not have permission');
            end;
        }
        field(50003; "COO-Approved"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                userSet: Record "User Setup";
            begin
                userSet.Get(UserId);
                if not userSet."COO Approval" = true then
                    Error('You do not have permission');
            end;
        }
        field(50004; "MD-Approved"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                userSet: Record "User Setup";
            begin
                userSet.Get(UserId);
                if not userSet."MD-Approval" = true then
                    Error('You do not have permission');
            end;
        }
        field(50005; "PR No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Last Purchase Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "HS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; Completed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50009; PR; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                item: Record Item;
                purchHead: Record "Purchase Header";
            begin
                if Type = Type::Item then begin
                    item.Get("No.");
                    "HS Code" := item."HS Code";
                    "Last Purchase Price" := item."Last Direct Cost";
                end
                else begin
                    "HS Code" := ' ';
                end;
                purchHead.Get("Document Type", "Document No.");
                "PR No." := purchHead."Purchase Requisition No.";

                if purchHead."Purchase Requisition" = true then begin
                    PR := true;
                end;
            end;
        }
    }

    var
        myInt: Integer;
}