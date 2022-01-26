// codeunit 50101 "CDS Mapping Addition"
// {
//     EventSubscriberInstance = StaticAutomatic;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetCustomerAccountMapping', '', true, true)]
//     local procedure HandleOnAfterResetContactContactMapping(IntegrationTableMappingName: Code[20])
//     var
//         ParentItem: Record "Parent Items";
//         CDSParentItem: Record "CRM Parent Items";
//         OEM: Record OEM;
//         CDSOEM: Record "CRM OEM";
//         Item: Record Item;
//         CDSItem: Record "CRM Product";
//         Countries: Record "Country/Region";
//         CDSCountry: Record "CRM Country";
//         Customer: Record Customer;
//         CDSCust: Record "CRM Account";
//         Contact: Record Contact;
//         CDSContact: Record "CRM Contact";
//         CustPrice: Record "Customer Price Group";
//         CDSCustPrice: Record "CRM Pricelevel";
//         ItemVendor: Record "Item Vendor";
//         CDSProductVendor: Record "CRM Product Vendor";
//         Salesheader: Record "Sales Header";
//         CDSSalesOrder: Record "CRM Salesorder";
//         IntegrationFieldMapping: Record "Integration Field Mapping";
//         IntegrationTableMapping: Record "Integration Table Mapping";
//     begin
//         //Sales Order +
//         /*IntegrationTableMappingName := 'SALESORDER-ORDER';

//         InsertIntegrationTableMapping(
//                     IntegrationTableMapping, IntegrationTableMappingName,
//                     DATABASE::"Sales Header", DATABASE::"CRM Salesorder",
//                     CDSSalesOrder.FieldNo(SalesOrderId), CDSSalesOrder.FieldNo(SalesOrderId),
//                     '', '', false);

//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo("No."), CDSSalesOrder.FieldNo(SalesOrderId),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Currentc), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Code), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Code), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Code), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Code), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Code), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Code), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Code), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Code), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Code), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Salesheader.FieldNo(Code), CDSSalesOrder.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         */
//         //Sales Order -

//         //CUSTPRCGRP-PRICE +
//         IntegrationTableMappingName := 'CUSTPRCGRP-PRICE';

//         InsertIntegrationTableMapping(
//                     IntegrationTableMapping, IntegrationTableMappingName,
//                     DATABASE::"Customer Price Group", DATABASE::"CRM Pricelevel",
//                     CDSCustPrice.FieldNo(PriceLevelId), CDSCustPrice.FieldNo(PriceLevelId),
//                     '', '', false);

//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         CustPrice.FieldNo(Code), CDSCustPrice.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         //CUSTPRCGRP-PRICE -

//         //Payment Terms +
//         IntegrationTableMappingName := 'PAYMENT TERMS';

//         InsertIntegrationTableMapping(
//                     IntegrationTableMapping, IntegrationTableMappingName,
//                     DATABASE::"Customer Price Group", DATABASE::"CRM Pricelevel",
//                     CDSCustPrice.FieldNo(PriceLevelId), CDSCustPrice.FieldNo(PriceLevelId),
//                     '', '', false);

//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         CustPrice.FieldNo(Code), CDSCustPrice.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         //Payment Terms -

//         //Item +
//         IntegrationTableMappingName := 'Item - Product';

//         InsertIntegrationTableMapping(
//                     IntegrationTableMapping, IntegrationTableMappingName,
//                     DATABASE::Item, DATABASE::"CRM Product",
//                     // Item.FieldNo("No."), CDSItem.FieldNo(ProductId),
//                     CDSItem.FieldNo(ProductId), CDSItem.FieldNo(ModifiedOn),
//                     '', '', false);

//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo("No."), CDSItem.FieldNo(ProductNumber),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo(Description), CDSItem.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // Item.FieldNo("Unit Price"), CDSItem.FieldNo(p),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo("Unit Cost"), CDSItem.FieldNo(StandardCost),
//          IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // Item.FieldNo("Unit Cost"), CDSItem.FieldNo(StandardCost),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo("Unit Volume"), CDSItem.FieldNo(StockVolume),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo("Gross Weight"), CDSItem.FieldNo(StockWeight),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo("Vendor No."), CDSItem.FieldNo(VendorID),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo("Vendor Item No."), CDSItem.FieldNo(VendorName),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo(Inventory), CDSItem.FieldNo(QuantityOnHand),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo(Condition), CDSItem.FieldNo(Condition),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo("Parent Item"), CDSItem.FieldNo("Parent Item"),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo("Market Average"), CDSItem.FieldNo("Market Average"),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo("Competitor Average"), CDSItem.FieldNo("Competitor Average"),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Item.FieldNo("Recommended Price"), CDSItem.FieldNo("Recommended Price"),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // Item.FieldNo("Country/Region of Origin Code"), CDSItem.FieldNo(),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         //Item -

//         //Country +
//         IntegrationTableMappingName := 'Country';

//         InsertIntegrationTableMapping(
//                     IntegrationTableMapping, IntegrationTableMappingName,
//                     DATABASE::"Country/Region", DATABASE::"CRM Country",
//                     // Item.FieldNo("No."), CDSItem.FieldNo(ProductId),
//                     Countries.FieldNo(SystemId), CDSCountry.FieldNo(SystemId),
//                     '', '', false);

//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Countries.FieldNo(Code), CDSCountry.FieldNo(Code),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Countries.FieldNo(Name), CDSCountry.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Countries.FieldNo("ISO Code"), CDSCountry.FieldNo("ISO Code"),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Countries.FieldNo("ISO Numeric Code"), CDSCountry.FieldNo("ISO Numeric Code"),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Countries.FieldNo("EU Country/Region Code"), CDSCountry.FieldNo("EU Country/Region Code"),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Countries.FieldNo("Intrastat Code"), CDSCountry.FieldNo("Intrastat Code"),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Countries.FieldNo("VAT Scheme"), CDSCountry.FieldNo("VAT Scheme"),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         Countries.FieldNo("Last Modified Date Time"), CDSCountry.FieldNo("Last Modified Date Time"),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         //Country -

//         //OEM +
//         IntegrationTableMappingName := 'OEM';

//         InsertIntegrationTableMapping(
//             IntegrationTableMapping, IntegrationTableMappingName,
//                     DATABASE::OEM, DATABASE::"CRM OEM",
//                     OEM.FieldNo(Name), CDSOEM.FieldNo(SystemId),
//                     '', '', false);

//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         OEM.FieldNo(Code), CDSOEM.FieldNo(Code),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         OEM.FieldNo(Name), CDSOEM.FieldNo(Name),
//         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         //OEM -

//         //Parent Item +
//         // IntegrationTableMappingName := 'Parent Items';

//         // InsertIntegrationTableMapping(
//         //             IntegrationTableMapping, IntegrationTableMappingName,
//         //             DATABASE::"Parent Items", DATABASE::"CRM Parent Items",
//         //             // ParentItem.FieldNo("No."), CDSParentItem.FieldNo("No."),
//         //             ParentItem.FieldNo("Parent Item"), CDSParentItem.FieldNo("Parent Item"),
//         //             '', '', false);

//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("No."), CDSParentItem.FieldNo("No."),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo(Description), CDSParentItem.FieldNo(Description),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Description 2"), CDSParentItem.FieldNo("Description 2"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Search Description"), CDSParentItem.FieldNo("Search Description"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Automatic Ext. Texts"), CDSParentItem.FieldNo("Automatic Ext. Texts"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Basic Unit of Meassure"), CDSParentItem.FieldNo("Basic Unit of Meassure"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo(OEM), CDSParentItem.FieldNo(OEM),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo(EAN), CDSParentItem.FieldNo(EAN),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo(GTIN), CDSParentItem.FieldNo(GTIN),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Net Weight"), CDSParentItem.FieldNo("Net Weight"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Gross Weight"), CDSParentItem.FieldNo("Gross Weight"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Unit Volume"), CDSParentItem.FieldNo("Unit Volume"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Tariff No."), CDSParentItem.FieldNo("Tariff No."),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Import Tariff Code"), CDSParentItem.FieldNo("Import Tariff Code"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Export Tariff Code"), CDSParentItem.FieldNo("Export Tariff Code"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Available New"), CDSParentItem.FieldNo("Available New"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Available Refurbished"), CDSParentItem.FieldNo("Available Refurbished"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // InsertIntegrationFieldMapping(IntegrationTableMappingName,
//         // ParentItem.FieldNo("Available Used"), CDSParentItem.FieldNo("Available Used"),
//         // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
//         // //Parent Item -
//     end;

//     local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
//     begin
//         IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::ToIntegrationTable, 'CDS');
//     end;

//     procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
//     var
//         IntegrationFieldMapping: Record "Integration Field Mapping";
//     begin
//         IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
//             ConstValue, ValidateField, ValidateIntegrationTableField);
//     end;
// }
