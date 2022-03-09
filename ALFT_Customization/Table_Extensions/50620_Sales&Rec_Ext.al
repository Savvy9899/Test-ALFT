tableextension 50620 "Sales&RecSetup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50010; "Material Loan In Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50011; "Material Loan Out Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    var
        myInt: Integer;
}