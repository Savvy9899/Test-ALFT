report 50437 PaymentApprovalSheet
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/PaymentApprovalSheet.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(No_; "No.")
            { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            { }
            column(Prepayment_Due_Date; "Prepayment Due Date")
            { }
            column(Amount; Amount)
            { }
            column(advance; advance)
            { }
            trigger OnAfterGetRecord()
            begin
                CalcFields(Amount);

                advance := ("Prepayment %" * Amount) / 100;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        advance: Decimal;
}