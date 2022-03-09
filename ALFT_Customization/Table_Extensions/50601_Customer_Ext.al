tableextension 50601 CustomerExt extends Customer
{
    fields
    {
        field(50000; "Customer Classification"; Text[50])
        {
            DataClassification = ToBeClassified;
            ValidateTableRelation = false;
            TableRelation = "Reference Data".Description where(Type = filter("Customer Classification"));
        }
        field(50001; "Customer's Line of Bus."; Text[50])
        {
            DataClassification = ToBeClassified;
            ValidateTableRelation = false;
            TableRelation = "Reference Data".Description where(Type = filter("Customer's Line of Bus."));
        }
        field(50002; Segment; Text[50])
        {
            DataClassification = ToBeClassified;
            ValidateTableRelation = false;
            TableRelation = "Reference Data".Description where(Type = filter(Segment));
        }
        field(50003; "Commisions Groups"; Text[50])
        {
            DataClassification = ToBeClassified;
            ValidateTableRelation = false;
            TableRelation = "Reference Data".Description where(Type = filter("Commisions Groups"));
        }
        field(50004; "Customers Sales Group"; Text[50])
        {
            DataClassification = ToBeClassified;
            ValidateTableRelation = false;
            TableRelation = "Reference Data".Description where(Type = filter("Customers Sales Group"));
        }
        field(50005; "NBT Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "SVAT Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "TIN No."; Code[20])
        {
            DataClassification = ToBeClassified;
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

    var
        myInt: Integer;
}