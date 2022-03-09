tableextension 50600 Item_Ext extends Item
{
    fields
    {
        field(50200; "HS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50201; "Our Product Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}