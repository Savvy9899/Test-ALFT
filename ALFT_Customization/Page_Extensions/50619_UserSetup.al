pageextension 50619 User_Setup extends "User Setup"
{
    layout
    {
        addafter("DO Approval")
        {
            field("MD-Approved"; "MD-Approval")
            {
                ApplicationArea = All;
            }
            field("DEP-Checked"; "DEP-Checked")
            {
                ApplicationArea = All;
            }
            field("Sample Approval"; "Sample Approval")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}