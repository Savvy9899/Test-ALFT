report 50430 "Daily Production Order Plan"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-M-029_DailyProductionOrderPlan.rdl';

    dataset
    {
        dataitem("Prod. Order Line"; "Prod. Order Line")
        {
            RequestFilterFields = "Starting Date";
            column(Line_No_; "Line No.")
            { }
            column(Starting_Date_Time; "Starting Date-Time")
            { }
            column(Item_No_; "Item No.")
            { }
            column(Description; Description)
            { }
            column(Prod__Order_No_; "Prod. Order No.")
            { }
            column(machine; machine)
            { }
            column(Quantity; Quantity)
            { }
            column(Finished_Quantity; "Finished Quantity")
            { }
            column(Remaining_Quantity; "Remaining Quantity")
            { }
            column(baseRM; baseRM)
            { }
            trigger OnAfterGetRecord()
            begin
                baseRM := '';

                // if "Line No." = 10000 then
                //     CurrReport.Skip();

                prodRouting.Reset();
                prodRouting.SetRange("Routing No.", "Routing No.");
                prodRouting.SetRange("Routing Reference No.", "Line No.");
                prodRouting.SetRange("Prod. Order No.", "Prod. Order No.");
                if prodRouting.Find() then begin
                    if prodRouting."No." <> mach then
                        CurrReport.Skip()
                    else
                        machine := prodRouting.Description;
                end;

                prodOrderCom.Reset();
                prodOrderCom.SetRange(Status, Status);
                prodOrderCom.SetRange("Prod. Order No.", "Prod. Order No.");
                prodOrderCom.SetRange("Prod. Order Line No.", "Line No.");
                if prodOrderCom.FindSet() then
                    repeat
                        baseRM := prodOrderCom.Description + ' | ' + baseRM
                    until prodOrderCom.Next() = 0;
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
                    field(mach; mach)
                    {
                        ApplicationArea = All;
                        Caption = 'Machine';
                    }
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
        prodRouting: Record "Prod. Order Routing Line";
        machine: Text;
        prodOrderCom: Record "Prod. Order Component";
        baseRM: Text;
        mach: Code[20];
}