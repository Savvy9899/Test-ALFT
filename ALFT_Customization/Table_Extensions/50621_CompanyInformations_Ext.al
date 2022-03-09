tableextension 50621 CompInformationExt extends "Company Information"
{
    fields
    {
        field(50000; "NBT Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "SVAT Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "SVAT %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}