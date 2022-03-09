tableextension 50619 UserSetup_Ext extends "User Setup"
{
    fields
    {
        field(50023; "DEP-Checked"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "MD-Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Sample Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}