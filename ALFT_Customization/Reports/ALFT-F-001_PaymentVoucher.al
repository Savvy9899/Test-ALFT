report 50405 "Payment Voucher"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-F-001_PaymentVoucher.rdl';

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            column(Document_No_; "Document No.")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Description; Description)
            { }
            column(Amount; Amount)
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
            column(Message_to_Recipient; "Message to Recipient")
            { }
            column(bankName; bank.Name)
            { }
            column(bankBranch; bank."Bank Branch No.")
            { }
            column(External_Document_No_; "External Document No.")
            { }
            column(Name; Name)
            { }
            column(NoTxt1; NoTxt[1])
            { }
            column(NoTxt2; NoTxt[2])
            { }
            column(externalDoc; externalDoc)
            { }
            column(Payment_Method_Code; "Payment Method Code")
            { }

            trigger OnAfterGetRecord()
            var
                check: Report "Check-Customized";
            begin
                externalDoc := '';

                comRec.Get;
                comRec.CalcFields(Picture);
                if comCountry.Get(comRec."Country/Region Code") then;
                if bank.Get("Bal. Account No.") then;

                if "Account Type" = "Account Type"::"Bank Account" then begin
                    bank1.Get("Account No.");
                    Name := bank1.Name;
                end
                else
                    if "Account Type" = "Account Type"::"G/L Account" then begin
                        glAcc.Get("Account No.");
                        Name := glAcc.Name;
                    end
                    else
                        if "Account Type" = "Account Type"::Vendor then begin
                            vendor.Get("Account No.");
                            Name := vendor.Name;
                        end;

                vendLed.Reset();
                vendLed.SetRange("Applies-to ID", "Document No.");
                if vendLed.FindSet() then begin
                    repeat
                        externalDoc := externalDoc + vendLed."External Document No." + ',';
                    until vendLed.Next() = 0;
                end;

                check.InitTextVariable;
                check.FormatNoTextCustomized(NoTxt, "Amount (LCY)", '');

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
        comCountry: Record "Country/Region";
        bank: Record "Bank Account";
        bank1: Record "Bank Account";
        glAcc: Record "G/L Account";
        vendor: Record Vendor;
        Name: Text;
        NoTxt: array[2] of Text[100];
        vendLed: Record "Vendor Ledger Entry";
        externalDoc: Text;
}