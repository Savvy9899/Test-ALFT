tableextension 50607 PurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(50000; "Purchase Requisition"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "PI Received"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "LC Application Sent to Bank"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "LC Opened"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; Approved; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Purchase Requisition No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = filter(Quote), "Purchase Requisition" = const(true), Completed = const(false));

            trigger OnValidate()
            var
                purchQuoteLine: Record "Purchase Line";
                PurchReqLine: Record "Purchase Line";
                Inx: Integer;
            begin
                purchQuoteLine.Reset();
                purchQuoteLine.SetRange("Document Type", "Document Type"::Quote);
                purchQuoteLine.SetRange("Document No.", "No.");
                if purchQuoteLine.FindFirst() then
                    Error('Quote lines already exists');

                PurchReqLine.Reset();
                PurchReqLine.SetRange("Document Type", "Document Type"::Quote);
                PurchReqLine.SetRange("Document No.", "Purchase Requisition No.");
                PurchReqLine.SetRange("DO-Approved", true);
                PurchReqLine.SetRange("COO-Approved", true);
                PurchReqLine.SetRange("MD-Approved", true);
                PurchReqLine.SetRange("DEP-Checked", true);
                if PurchReqLine.FindSet() then begin
                    repeat
                        Inx += 10000;
                        purchQuoteLine.Init();
                        purchQuoteLine."Document Type" := "Document Type";
                        purchQuoteLine."Document No." := "No.";
                        purchQuoteLine."Line No." := Inx;
                        purchQuoteLine.Validate(Type, PurchReqLine.Type);
                        purchQuoteLine.Validate("No.", PurchReqLine."No.");
                        purchQuoteLine.Validate("VAT Prod. Posting Group", PurchReqLine."VAT Prod. Posting Group");
                        purchQuoteLine.Validate(Description, PurchReqLine.Description);
                        purchQuoteLine.Validate(Quantity, PurchReqLine.Quantity);
                        purchQuoteLine."Unit of Measure Code" := PurchReqLine."Unit of Measure Code";
                        purchQuoteLine."DO-Approved" := PurchReqLine."DO-Approved";
                        purchQuoteLine."COO-Approved" := PurchReqLine."COO-Approved";
                        purchQuoteLine."MD-Approved" := PurchReqLine."MD-Approved";
                        purchQuoteLine."DEP-Checked" := PurchReqLine."DEP-Checked";
                        purchQuoteLine.Insert(true);
                    until PurchReqLine.Next() = 0;
                    Message('PR Lines Inserted Successfully');
                end
                else begin
                    Message('Nothing to load');
                end;

            end;
        }
        field(50006; "Profoma Invoice No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "L/C No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Material Loan In"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50009; "Material Loan Out"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50021; Remarks; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50022; Completed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Required Before"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "Delivery Term"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Purch. Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        modify("Buy-from Vendor No.")
        {
            trigger OnAfterValidate()
            var
                paySetup: Record "Purchases & Payables Setup";
            begin
                paySetup.Get;
                if "No. Series" = paySetup."Purchase Req. Nos." then
                    "Purchase Requisition" := true
                else
                    if "No. Series" = paySetup."Service Req. Nos." then
                        "Purchase Requisition" := true
                    else
                        "Purchase Requisition" := false;
            end;
        }
    }

    var
        myInt: Integer;
}