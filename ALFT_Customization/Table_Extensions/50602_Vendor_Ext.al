tableextension 50602 "Vendor EXT" extends Vendor
{
    fields
    {
        field(50000; "Avg. Vendor Delivery Time"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Quality of the Service"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Good,Bad,Medium;
            OptionCaption = ' ,Good,Medium,Bad';
        }
        field(50002; "Product Quality"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Good,Bad,Medium;
            OptionCaption = ' ,Good,Medium,Bad';
        }
        field(50008; "E-mail 2"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "E-mail 3"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
    }
}