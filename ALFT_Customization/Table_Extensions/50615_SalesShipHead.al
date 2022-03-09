tableextension 50615 SaleShipHeader extends "Sales Shipment Header"
{
    fields
    {
        field(50001; "ALFT Quote No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Confirmation"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Confirmed,"Not Confirmed";
            OptionCaption = ' ,Confirmed,Not Confirmed';
        }
        field(50003; "Material Loan In"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50004; "Material Loan Out"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50005; Approved; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Prod. Ord. No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Item No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Item Description"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Vehicle No."; Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Driver No."; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "No of Reels/Boxes/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Qty per Reels/Boxes/Bundle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}