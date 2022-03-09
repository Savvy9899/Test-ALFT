tableextension 50623 SalesLineExtension extends "Sales Line"
{
    fields
    {
        field(50000; "No. 2"; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Sales Order Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Order Quantity","Excess Quantity","Cyl. Discount";
            OptionCaption = ' ,Order Quantity,Excess Quantity,Cyl. Discount';
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                item: Record Item;
                salesHead: Record "Sales Header";
            begin
                if Type = Type::Item then begin
                    item.Get("No.");
                    "No. 2" := item."No. 2";

                    salesHead.Get("Document Type", "Document No.");
                    salesHead."Item No." := "No.";
                    salesHead."Item Description" := Description;
                    salesHead.Modify();
                end;

                // Message('1%', "Sales Order Type");
                // if "Sales Order Type" = "Sales Order Type"::" " then
                //     Error('Order Type must have a value');
            end;
        }
    }

    var
        myInt: Integer;
}