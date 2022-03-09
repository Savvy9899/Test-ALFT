codeunit 50400 "Development Management"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Quote to Order", 'OnCreatePurchHeaderOnBeforePurchOrderHeaderModify', '', true, true)]
    procedure UpdatePR(var PurchHeader: Record "Purchase Header"; var PurchOrderHeader: Record "Purchase Header");
    var
        PrHedd: Record "Purchase Header";
    begin
        PrHedd.get(PrHedd."Document Type"::Quote, PurchHeader."Purchase Requisition No.");
        PrHedd.Completed := true;
        PrHedd."Purch. Order No." := PurchOrderHeader."No."; //RJ
        PrHedd.Modify();
    end;

    [EventSubscriber(ObjectType::Table, 5740, 'OnAfterGetNoSeriesCode', '', true, true)]
    procedure UpdateMRNNos(var TransferHeader: Record "Transfer Header"; var NoSeriesCode: Code[20]);
    var
        InvenSetup: Record "Inventory Setup";
    begin
        InvenSetup.Get();
        InvenSetup.TestField("MRN Nos.");
        if TransferHeader."Transfer Order Type" = TransferHeader."Transfer Order Type"::MRN then
            NoSeriesCode := InvenSetup."MRN Nos.";
    end;

    [Eventsubscriber(ObjectType::Table, 5747, 'OnAfterCopyFromTransferLine', '', true, true)]
    local procedure UpdatetransRecLine(var TransferReceiptLine: Record "Transfer Receipt Line"; TransferLine: Record "Transfer Line")
    begin
        TransferReceiptLine."Quantity Shipped" := TransferLine."Quantity Shipped"
    end;
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnAfterConfirmPost', '', true, true)]
    // procedure CheckOption(var SalesHeader: Record "Sales Header");
    // var

    // begin

    // end;
    [EventSubscriber(ObjectType::Codeunit, codeunit::"Create Prod. Order from Sale", 'OnCreateProdOrderOnAfterProdOrderInsert', '', true, true)]
    local procedure UpdateSO(var ProductionOrder: Record "Production Order"; SalesLine: Record "Sales Line")
    var
        SalesHeddRec: Record "Sales Header";
    begin
        SalesHeddRec.get(SalesHeddRec."Document Type"::Order, SalesLine."Document No.");
        SalesHeddRec."Prod. Ord. No." := ProductionOrder."No.";
        //
        SalesHeddRec.Modify();
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Purch.-Post", 'OnBeforePurchRcptHeaderInsert', '', true, true)]
    local procedure PurchRecInsert(VAR PurchRcptHeader: Record "Purch. Rcpt. Header"; VAR PurchaseHeader: Record "Purchase Header"; CommitIsSupressed: Boolean)
    begin
        PurchRcptHeader."Vendor Invoice No." := PurchaseHeader."Vendor Invoice No.";
    end;

    [EventSubscriber(ObjectType::table, 5745, 'OnAfterCopyFromTransferLine', '', true, true)]
    local procedure UpdateShipLine(TransferLine: Record "Transfer Line"; var TransferShipmentLine: Record "Transfer Shipment Line")
    begin
        TransferShipmentLine."Prod. Ord. No." := TransferLine."Prod. Ord. No.";

    end;

    [EventSubscriber(ObjectType::table, 5747, 'OnAfterCopyFromTransferLine', '', true, true)]
    local procedure UpdateRecLine(TransferLine: Record "Transfer Line"; var TransferReceiptLine: Record "Transfer Receipt Line")
    begin
        TransferReceiptLine."Prod. Ord. No." := TransferLine."Prod. Ord. No.";

    end;

    [EventSubscriber(ObjectType::Codeunit, 5704, 'OnAfterCreateItemJnlLine', '', true, true)]
    local procedure UpdateItemJnal(var ItemJournalLine: Record "Item Journal Line"; TransferLine: Record "Transfer Line"; TransferShipmentHeader: Record "Transfer Shipment Header"; TransferShipmentLine: Record "Transfer Shipment Line")
    begin
        ItemJournalLine."Prod. Ord. No." := TransferShipmentHeader."Prod. Ord. No.";
        //New Change
        ItemJournalLine."Trans. Ord. Qty" := TransferLine.Quantity;
    end;

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure UpdateItemLed(var NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry."Prod. Ord. No." := ItemJournalLine."Prod. Ord. No.";
        NewItemLedgEntry."Trans. Ord. Qty" := ItemJournalLine."Trans. Ord. Qty";
    end;

    [EventSubscriber(ObjectType::table, 5746, 'OnAfterCopyFromTransferHeader', '', true, true)]
    local procedure UpdateRecHeader(TransferHeader: Record "Transfer Header"; var TransferReceiptHeader: Record "Transfer Receipt Header")
    begin
        TransferReceiptHeader."Prod. Ord. No." := TransferHeader."Prod. Ord. No.";
    end;

    [EventSubscriber(ObjectType::table, 5744, 'OnAfterCopyFromTransferHeader', '', true, true)]
    local procedure UpdateShipHeader(TransferHeader: Record "Transfer Header"; var TransferShipmentHeader: Record "Transfer Shipment Header")
    begin
        TransferShipmentHeader."Prod. Ord. No." := TransferHeader."Prod. Ord. No.";
    end;
}