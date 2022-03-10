report 50404 PurchaseOrderImport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Purchase Order-Import';
    RDLCLayout = 'Report_Layouts/ALFT-P-004_PurchaseOrder-Imports.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(No_; "No.")
            { }
            column(Document_Date; "Document Date")
            { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            { }
            column(Buy_from_Address; "Buy-from Address")
            { }
            column(Buy_from_Address_2; "Buy-from Address 2")
            { }
            column(Buy_from_City; "Buy-from City")
            { }
            column(buyFromCountry; buyFromCountry.Name)
            { }
            column(Ship_to_Name; "Ship-to Name")
            { }
            column(Ship_to_Address; "Ship-to Address")
            { }
            column(Ship_to_Address_2; "Ship-to Address 2")
            { }
            column(Ship_to_City; "Ship-to City")
            { }
            column(shipCountry; shipCountry.Name)
            { }
            column(Profoma_Invoice_No_; "Profoma Invoice No.")
            { }
            column(Shipment_Method_Code; shipType.Description)
            { }
            column(Payment_Method_Code; payType.Description)
            { }
            column(Remarks; Remarks)
            { }
            column(Amount; Amount)
            { }
            column(L_C_No_; "L/C No.")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Amount_Including_VAT; "Amount Including VAT")
            { }
            column(vatAmount; vatAmount)
            { }
            column(Currency_Code; "Currency Code")
            { }
            column(Delivery_Term; "Delivery Term")
            { }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLinkReference = "Purchase Header";
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                column(Description; Description)
                { }
                column(Order_Date; "Expected Receipt Date")
                { }
                column(Quantity; Quantity)
                { }
                column(Line_Discount_Amount; "Line Discount Amount")
                { }
                column(Unit_Cost; "Direct Unit Cost")
                { }
                column(Line_Amount; "Line Amount")
                { }
                column(comRecLogo; comRec.Picture)
                { }
                column(comRecName; comRec.Name)
                { }
                column(comRecAddress; comRec.Address)
                { }
                column(comRecAddress2; comRec."Address 2")
                { }
                column(comRecCity; comRec.City)
                { }
                column(comCountry; comCountry.Name)
                { }
                column(comRecPhone; comRec."Phone No.")
                { }
                column(comRecEmail; comRec."E-Mail")
                { }
                column(comRecVat; comRec."VAT Registration No.")
                { }
                column(vatPostSet; vatPostSet."VAT %")
                { }
                column(Buy_from_Contact_No_; contact."Phone No.")
                { }
                trigger OnAfterGetRecord()
                begin
                    comRec.Get;
                    comRec.CalcFields(Picture);
                    vatPostSet.Get("VAT Bus. Posting Group", "VAT Prod. Posting Group");
                    if contact.Get("Purchase Header"."Buy-from Contact No.") then;
                    if buyFromCountry.Get("Purchase Header"."Buy-from Country/Region Code") then;
                    if shipCountry.Get("Purchase Header"."Ship-to Country/Region Code") then;
                    if shipType.Get("Purchase Header"."Shipment Method Code") then;
                    if payType.Get("Purchase Header"."Payment Terms Code") then;
                    if comCountry.Get(comRec."Country/Region Code") then;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                CalcFields(Amount);
                CalcFields("Amount Including VAT");
                vatAmount := "Amount Including VAT" - Amount;
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
                { }
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
        comRec: Record "Company Information";
        buyFromCountry: Record "Country/Region";
        comCountry: Record "Country/Region";
        shipCountry: Record "Country/Region";
        shipType: Record "Shipment Method";
        payType: Record "Payment Terms";
        vatAmount: Decimal;
        vatPostSet: Record "VAT Posting Setup";
        contact: Record Contact;
}