tableextension 50610 PurchCrMemoHead extends "Purch. Cr. Memo Hdr."
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
        }
        field(50006; "Profoma Invoice No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "L/C No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Material Loan No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Material Loan Out"; Code[20])
        {
            DataClassification = ToBeClassified;
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

    }
}