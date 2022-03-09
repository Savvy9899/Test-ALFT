pageextension 50617 PurchaseAgentAct extends "Purchase Agent Activities"
{
    layout
    {
        addafter("Upcoming Orders")
        {
            field("PI Received"; "PI Received")
            {
                ApplicationArea = All;
                DrillDownPageId = "Purchase Quotes";
            }
            field("LC Application Send to Bank"; "LC Application Send to Bank")
            {
                ApplicationArea = All;
                DrillDownPageId = "Purchase Quotes";
            }
            field("LC Has Opened"; "LC Has Opened")
            {
                ApplicationArea = All;
                DrillDownPageId = "Purchase Quotes";
            }
            field("Approved Purchase Requisitions"; "Approved Purchase Requisitions")
            {
                ApplicationArea = All;
                DrillDownPageId = "Purchase Quote Lines";
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