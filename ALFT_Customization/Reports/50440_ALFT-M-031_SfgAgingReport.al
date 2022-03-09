report 50440 "SFG Aging Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Report_Layouts/ALFT-M-031_SfgAgingReport.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = where("Entry Type" = filter(Output));

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

                itemLed.Init();
                itemLed."Entry No." := "Entry No.";
                itemLed."Document Type" := "Document Type";
                itemLed."Document No." := "Document No.";
                itemLed."Item No." := "Item No.";
                itemLed.Description := Description;
                itemLed."Prod. Ord. No." := "Prod. Ord. No.";
                itemLed."Source No." := "Source No.";
                itemLed."Posting Date" := "Posting Date";
                itemLed."Remaining Quantity" := Quantity;
                itemLed.Insert();

            end;
        }
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));

            column(DocNo; itemLed."Document No.")
            { }
            column(CusNo; itemLed.Description)
            { }
            column(quantity; itemLed.Quantity)
            { }
            column(Uom; item."Base Unit of Measure")
            { }
            column(postingDate; itemLed."Posting Date")
            { }
            column(itemLed; itemLed."Prod. Ord. No.")
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
                itemLed.SETCURRENTKEY("Entry No.", "Document No.");
                UpdateMonth;

                if item.Get(itemLed."Item No.") then;
                if item."Inventory Posting Group" <> 'FG' then
                    CurrReport.Skip();
            end;

            trigger OnAfterGetRecord()
            var
                Inx: Integer;
            begin

                IF Number = 1 THEN BEGIN
                    IF NOT itemLed.FINDSET(FALSE, FALSE) THEN
                        CurrReport.BREAK;
                END ELSE
                    IF itemLed.NEXT = 0 THEN
                        CurrReport.BREAK;

                FOR Inx := 1 TO NoOfBuckets DO BEGIN

                    AryAmt[Inx] := 0;

                    IF (itemLed."Posting Date" >= StAryDate[Inx]) AND
                       (itemLed."Posting Date" <= EdAryDate[Inx]) THEN BEGIN
                        AryAmt[Inx] := ABS(itemLed."Remaining Quantity");
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
        // IF EdDate <> InvEdDate THEN
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
        itemLed: Record "Item Ledger Entry" temporary;
        item: Record Item;
        stock: Decimal;
        item2: Record Item;

}