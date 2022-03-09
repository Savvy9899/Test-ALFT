tableextension 50626 ContactExt extends Contact
{
    fields
    {
        field(50009; "E-mail 3"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}