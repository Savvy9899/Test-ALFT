tableextension 50617 PurchaseCue extends "Purchase Cue"
{
    fields
    {
        field(50000; "PI Received"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Quote), "PI Received" = FILTER(true)));
        }
        field(50001; "LC Application Send to Bank"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Quote), "LC Application Sent to Bank" = FILTER(true)));
        }
        field(50002; "LC Has Opened"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Quote), "LC Opened" = FILTER(true)));
        }
        field(50003; "Approved Purchase Requisitions"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Purchase Line" WHERE("Document Type" = filter(Quote), "PR" = filter(true), "COO-Approved" = filter(true), "MD-Approved" = filter(true), "DO-Approved" = filter(true), Completed = filter(false)));
        }
    }

    var
        myInt: Integer;
}