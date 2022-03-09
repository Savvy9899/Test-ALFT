tableextension 50606 PurchaseReceiptLine extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50001; "DEP-Checked"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "DO-Approved"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "COO-Approved"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "MD-Approved"; Boolean)
        {
            DataClassification = ToBeClassified;
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
    }

    var
        myInt: Integer;
}