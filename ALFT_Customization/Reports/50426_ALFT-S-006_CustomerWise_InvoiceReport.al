report 50426 "Customer Wise Invoice Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-S-006_CustomerWiseInvoice.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {

            trigger OnPreDataItem()
            begin
                if RStDate = 0D then
                    Error('Start Date must have a value');

                if REdDate = 0D then
                    Error('End Date must have a value');

                if (NoOfBuckets = 0) or (NoOfBuckets > 12) then
                    Error('No of buckets must be 1 - 12');
                InvStDate := RStDate;
                InvEdDate := REdDate;
                SetRange("Posting Date", RStDate, REdDate);
            end;

            trigger OnAfterGetRecord()
            begin
                TempSalesInvHedd.Init();
                TempSalesInvHedd."No." := "No.";
                TempSalesInvHedd."Sell-to Customer No." := "Sell-to Customer No.";
                TempSalesInvHedd."Sell-to Customer Name" := "Sell-to Customer Name";
                TempSalesInvHedd."Posting Date" := "Posting Date";
                CalcFields("Amount Including VAT");
                TempSalesInvHedd."Amount Including VAT" := "Amount Including VAT";
                TempSalesInvHedd.Insert();
            end;
        }
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            trigger OnPreDataItem()
            begin
                SetRange("Posting Date", RStDate, REdDate);
                CrdStDate := RStDate;
                CrdEdDate := REdDate;
            end;

            trigger OnAfterGetRecord()
            begin
                TempSalesInvHedd.Init();
                TempSalesInvHedd."No." := "No.";
                TempSalesInvHedd."Sell-to Customer No." := "Sell-to Customer No.";
                TempSalesInvHedd."Sell-to Customer Name" := "Sell-to Customer Name";
                TempSalesInvHedd."Posting Date" := "Posting Date";
                CalcFields("Amount Including VAT");
                TempSalesInvHedd."Amount Including VAT" := -"Amount Including VAT";
                TempSalesInvHedd.Insert();
            end;
        }
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));

            column(DocNo; TempSalesInvHedd."No.")
            { }
            column(CusNo; TempSalesInvHedd."Sell-to Customer No.")
            { }
            column(CusName; TempSalesInvHedd."Sell-to Customer Name")
            { }
            column(AryAmt1; AryAmt[1])
            { }
            column(AryAmt2; AryAmt[2])
            { }
            column(AryAmt3; AryAmt[3])
            { }
            column(AryAmt4; AryAmt[4])
            { }
            column(AryAmt5; AryAmt[5])
            { }
            column(AryAmt6; AryAmt[6])
            { }
            column(AryAmt7; AryAmt[7])
            { }
            column(AryAmt8; AryAmt[8])
            { }
            column(AryAmt9; AryAmt[9])
            { }
            column(AryAmt10; AryAmt[10])
            { }
            column(AryAmt11; AryAmt[11])
            { }
            column(AryAmt12; AryAmt[12])
            { }
            column(MonthRangeDown1; MonthRangeDown[1])
            { }
            column(MonthRangeDown2; MonthRangeDown[2])
            { }
            column(MonthRangeDown3; MonthRangeDown[3])
            { }
            column(MonthRangeDown4; MonthRangeDown[4])
            { }
            column(MonthRangeDown5; MonthRangeDown[5])
            { }
            column(MonthRangeDown6; MonthRangeDown[6])
            { }
            column(MonthRangeDown7; MonthRangeDown[7])
            { }
            column(MonthRangeDown8; MonthRangeDown[8])
            { }
            column(MonthRangeDown9; MonthRangeDown[9])
            { }
            column(MonthRangeDown10; MonthRangeDown[10])
            { }
            column(MonthRangeDown11; MonthRangeDown[11])
            { }
            column(MonthRangeDown12; MonthRangeDown[12])
            { }
            trigger OnPreDataItem()
            begin
                TempSalesInvHedd.SETCURRENTKEY("Sell-to Customer No.", "No.");
                UpdateMonth;
            end;

            trigger OnAfterGetRecord()
            var
                Inx: Integer;
            begin
                IF Number = 1 THEN BEGIN
                    IF NOT TempSalesInvHedd.FINDSET(FALSE, FALSE) THEN
                        CurrReport.BREAK;
                END ELSE
                    IF TempSalesInvHedd.NEXT = 0 THEN
                        CurrReport.BREAK;

                TempSalesInvHedd.CalcFields("Amount Including VAT");

                FOR Inx := 1 TO NoOfBuckets DO BEGIN

                    AryAmt[Inx] := 0;

                    IF (TempSalesInvHedd."Posting Date" >= StAryDate[Inx]) AND
                       (TempSalesInvHedd."Posting Date" <= EdAryDate[Inx]) THEN BEGIN
                        //  Message('St %1 - Ed %2', StAryDate[Inx], EdAryDate[Inx]);
                        TempSalesInvHedd.CalcFields("Amount Including VAT");
                        AryAmt[Inx] := TempSalesInvHedd."Amount Including VAT";
                    END;
                END;
            end;

        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(NoOfBuckets; NoOfBuckets)
                    {
                        ApplicationArea = All;
                        Caption = 'No of Buckets';
                        MaxValue = 12;
                        MinValue = 1;
                    }
                    field(RStDate; RStDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                    }
                    field(REdDate; REdDate)
                    {
                        ApplicationArea = All;
                        Caption = 'End Date';
                    }
                }
            }
        }

    }
    local procedure UpdateMonth()
    var
        MonYerText: Text[10];
        StDate: Date;
        EdDate: Date;
        Inx: Integer;
        Mon: Integer;
        Yer: Integer;
    begin
        StDate := CALCDATE('<-CM>', InvStDate);
        IF StDate <> InvStDate THEN
            ERROR('Starting date must be month start date.');
        EdDate := CALCDATE('<CM>', InvEdDate);
        IF EdDate <> InvEdDate THEN
            ERROR('Ending date must be month end date.');
        EdDate := CALCDATE('<' + FORMAT(NoOfBuckets - 1) + 'M>', StDate);
        EdDate := CALCDATE('<CM>', EdDate);
        //IF EdDate <> InvEdDate THEN
        // ERROR('Date range must be equal to number of buckets.');

        FOR Inx := 1 TO NoOfBuckets DO BEGIN
            StAryDate[Inx] := StDate;
            EdAryDate[Inx] := CALCDATE('<CM>', StDate);

            Mon := DATE2DMY(StDate, 2);
            Yer := DATE2DMY(StDate, 3);
            MonYerText := '';
            IF Mon = 1 THEN
                MonYerText := 'Jan-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 2 THEN
                MonYerText := 'Feb-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 3 THEN
                MonYerText := 'Mar-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 4 THEN
                MonYerText := 'Apr-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 5 THEN
                MonYerText := 'May-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 6 THEN
                MonYerText := 'Jun-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 7 THEN
                MonYerText := 'Jul-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 8 THEN
                MonYerText := 'Aug-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 9 THEN
                MonYerText := 'Sep-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 10 THEN
                MonYerText := 'Oct-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 11 THEN
                MonYerText := 'Nov-' + COPYSTR(FORMAT(Yer), 3, 2);
            IF Mon = 12 THEN
                MonYerText := 'Dec-' + COPYSTR(FORMAT(Yer), 3, 2);
            MonthRangeDown[Inx] := MonYerText;

            StDate := CALCDATE('<1M>', StDate);
        END;
    end;

    var
        NoOfBuckets: Integer;
        InvStDate: Date;
        InvEdDate: Date;
        CrdStDate: Date;
        CrdEdDate: Date;
        RStDate: Date;
        REdDate: Date;
        StAryDate: array[12] of Date;
        EdAryDate: array[12] of Date;
        AryAmt: array[12] of Decimal;
        MonthRangeDown: array[12] of Text[10];
        TempSalesInvHedd: Record "Sales Invoice Header" temporary;

}