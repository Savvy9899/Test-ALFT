tableextension 50624 InvnSetup extends "Inventory Setup"
{
    fields
    {
        field(50010; "MRN Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

}