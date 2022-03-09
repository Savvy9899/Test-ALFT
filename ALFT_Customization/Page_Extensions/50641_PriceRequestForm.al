pageextension 50641 PriceRequestForm extends "Price Request Form"
{
    layout
    {
    }

    actions
    {
        addafter("Costing Complete")
        {
            action("Price Request Form Report")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    price: Record "Price Request Form";
                begin
                    price.Reset();
                    price.SetRange("No.", "No.");
                    Report.RunModal(50429, true, true, price);
                end;
            }
        }
    }

    var
        myInt: Integer;
}