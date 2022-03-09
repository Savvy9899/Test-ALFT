pageextension 50606 SalesOrdPlan extends "Sales Order Planning"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify("&Create Prod. Order")
        {
            trigger OnBeforeAction()
            var
                saleHead: Record "Sales Header";
            begin
                saleHead.Reset();
                saleHead.SetRange("No.", "Sales Order No.");
                if saleHead.FindSet() then begin
                    if saleHead.Status = saleHead.Status::Released then begin
                    end
                    else begin
                        Error('Sales Order %1 should be released', saleHead."No.");
                    end;
                end;
            end;
        }
    }

    var
        myInt: Integer;
}