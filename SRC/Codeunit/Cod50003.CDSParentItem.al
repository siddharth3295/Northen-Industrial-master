codeunit 50003 "CDS Parent Item"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Management", 'OnIsIntegrationRecord', '', true, true)]
    local procedure HandleOnIsIntegrationRecord(TableID: Integer; var isIntegrationRecord: Boolean)
    begin
        if TableID = DATABASE::"Parent Items" then
            isIntegrationRecord := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Management", 'OnAfterAddToIntegrationPageList', '', true, true)]
    local procedure HandleOnAfterAddToIntegrationPageList(var TempNameValueBuffer: Record "Name/Value Buffer"; var NextId: Integer)
    begin
        TempNameValueBuffer.Init();
        TempNameValueBuffer.ID := NextId;
        NextId := NextId + 1;
        TempNameValueBuffer.Name := Format(Page::"Parent Items");
        TempNameValueBuffer.Value := Format(Database::"Parent Items");
        TempNameValueBuffer.Insert();
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lookup CRM Tables", 'OnLookupCRMTables', '', true, true)]
    local procedure HandleOnLookupCRMTables(CRMTableID: Integer; NAVTableId: Integer; SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text; var Handled: Boolean)
    begin
        if CRMTableID = Database::"CRM Parent Items" then
            Handled := LookupCDSBox(CRMId, IntTableFilter);
    end;


    local procedure LookupCDSBox(var CRMId: Guid; IntTableFilter: Text): Boolean
    var
        CDSPriceCate: Record "CRM Parent Items";
        CDSPrcCatList: Page "CRM Parent Items";
    begin
        if not IsNullGuid(CRMId) then
            if CDSPriceCate.Get(CRMId) then
                CDSPrcCatList.SetRecord(CDSPriceCate);

        CDSPriceCate.SetView(IntTableFilter);
        CDSPrcCatList.SetTableView(CDSPriceCate);
        CDSPrcCatList.LookupMode(true);
        if CDSPrcCatList.RunModal() = ACTION::LookupOK then begin
            CDSPrcCatList.GetRecord(CDSPriceCate);
            CRMId := CDSPriceCate.new_productparentitemid;
            exit(true);
        end;
        exit(false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnGetCDSTableNo', '', false, false)]
    local procedure HandleOnGetCDSTableNo(BCTableNo: Integer; var CDSTableNo: Integer; var handled: Boolean)
    begin
        if BCTableNo = DATABASE::"Parent Items" then begin
            CDSTableNo := DATABASE::"CRM Parent Items";
            handled := true;
        end;

    end;
}
