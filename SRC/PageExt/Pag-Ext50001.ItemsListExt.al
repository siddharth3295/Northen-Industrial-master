pageextension 50001 "Items List Ext" extends "Item List"
{
    layout
    {
        modify("Production BOM No.")
        {
            Visible = true;
        }
        modify("Routing No.")
        {
            Visible = true;
        }
        addafter(Description)
        {
            field(Condition; Rec.Condition)
            {
                ToolTip = 'Specifies the value of the Condition field.';
                ApplicationArea = All;
            }
            field("Parent Item"; Rec."Parent Item")
            {
                ToolTip = 'Specifies the value of the Parent Item field.';
                ApplicationArea = All;
            }
            field("Part Code"; Rec."Part Code")
            {
                ToolTip = 'Specifies the value of the Part Code field.';
                ApplicationArea = All;
            }
            field("Part/Components"; Rec."Part/Components")
            {
                ToolTip = 'Specifies the value of the Part/Components field.';
                ApplicationArea = All;
            }

            field("OEM Code"; Rec."OEM Code")
            {
                ToolTip = 'Specifies the value of the OEM Code field.';
                ApplicationArea = All;
            }
            field(EAN; Rec.EAN)
            {
                ToolTip = 'Specifies the value of the EAN field.';
                ApplicationArea = All;
            }
        }
        addafter("Default Deferral Template Code")
        {
            field("Competitor Average"; Rec."Competitor Average")
            {
                ToolTip = 'Specifies the value of the Competitor Average field.';
                ApplicationArea = All;
            }
            field("Market Average"; Rec."Market Average")
            {
                ToolTip = 'Specifies the value of the Market Average field.';
                ApplicationArea = All;
            }
            field("Recommended Price"; Rec."Recommended Price")
            {
                ToolTip = 'Specifies the value of the Recommended Price field.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("Item Reclassification Journal")
        {
            action("Mapping Table CDS-Parent Item-Delete")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    FeildMapping: Record "Integration Field Mapping";
                begin
                    //Parent Item - Product
                    FeildMapping.Reset();
                    FeildMapping.SetRange("Integration Table Mapping Name", 'PARENT ITEMS');
                    FeildMapping.SetFilter("Field No.", '4');
                    if FeildMapping.FindFirst() then begin
                        FeildMapping.Delete();
                    end
                    //Parent Item -
                end;
            }
            action("Mapping Table CDS-Item")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ParentItem: Record "Parent Items";
                    CDSParentItem: Record "CRM Parent Items";
                    OEM: Record OEM;
                    CDSOEM: Record "CRM OEM";
                    Item: Record Item;
                    CDSItem: Record "CRM Product";
                    Countries: Record "Country/Region";
                    CDSCountry: Record "CRM Country";
                    Customer: Record Customer;
                    CDSCust: Record "CRM Account";
                    Contact: Record Contact;
                    CDSContact: Record "CRM Contact";
                    CustPrice: Record "Customer Price Group";
                    CDSCustPrice: Record "CRM Pricelevel";
                    ItemVendor: Record "Item Vendor";
                    CDSProductVendor: Record "CRM Product Vendor";
                    Salesheader: Record "Sales Header";
                    CDSSalesOrder: Record "CRM Salesorder";
                    IntegrationTableMappingName: Code[20];
                    IntegrationFieldMapping: Record "Integration Field Mapping";
                    IntegrationTableMapping: Record "Integration Table Mapping";
                    CDSDataVerse: Record 5341;
                    PaymentTerms: Record "Payment Terms";
                begin
                    //Item - Product
                    IntegrationTableMappingName := 'ITEM-PRODUCT';

                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("Vendor No."), CDSItem.FieldNo(VendorID),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("Vendor Item No."), CDSItem.FieldNo(VendorName),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo(Condition), CDSItem.FieldNo(Condition),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("Parent Item Id"), CDSItem.FieldNo("Parent Item GUID"),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("Market Average"), CDSItem.FieldNo("Market Average"),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("Competitor Average"), CDSItem.FieldNo("Competitor Average"),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("Recommended Price"), CDSItem.FieldNo("Recommended Price"),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("Type as Integer"), CDSItem.FieldNo(msdyn_fieldserviceproducttype),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);

                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("Qty. on Sales Order"), CDSItem.FieldNo(new_QuantityonSalesOrder),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);


                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("OEM Code"), CDSItem.FieldNo(OEM),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);

                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo(EAN), CDSItem.FieldNo(EAN),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);

                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("Country/Region of Origin Code"), CDSItem.FieldNo(new_CountryofOrigin),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //Item -
                end;
            }
            action("Mapping Table CDS-Item Type")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ParentItem: Record "Parent Items";
                    CDSParentItem: Record "CRM Parent Items";
                    OEM: Record OEM;
                    CDSOEM: Record "CRM OEM";
                    Item: Record Item;
                    CDSItem: Record "CRM Product";
                    Countries: Record "Country/Region";
                    CDSCountry: Record "CRM Country";
                    Customer: Record Customer;
                    CDSCust: Record "CRM Account";
                    Contact: Record Contact;
                    CDSContact: Record "CRM Contact";
                    CustPrice: Record "Customer Price Group";
                    CDSCustPrice: Record "CRM Pricelevel";
                    ItemVendor: Record "Item Vendor";
                    CDSProductVendor: Record "CRM Product Vendor";
                    Salesheader: Record "Sales Header";
                    CDSSalesOrder: Record "CRM Salesorder";
                    IntegrationTableMappingName: Code[20];
                    IntegrationFieldMapping: Record "Integration Field Mapping";
                    IntegrationTableMapping: Record "Integration Table Mapping";
                    CDSDataVerse: Record 5341;
                    PaymentTerms: Record "Payment Terms";
                begin
                    //Item - Product
                    IntegrationTableMappingName := 'ITEM-PRODUCT';


                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("Type as Integer"), CDSItem.FieldNo(msdyn_fieldserviceproducttype),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);




                    //Item -
                end;
            }

            action("Mapping Table CDS-Item Description 2")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ParentItem: Record "Parent Items";
                    CDSParentItem: Record "CRM Parent Items";
                    OEM: Record OEM;
                    CDSOEM: Record "CRM OEM";
                    Item: Record Item;
                    CDSItem: Record "CRM Product";
                    Countries: Record "Country/Region";
                    CDSCountry: Record "CRM Country";
                    Customer: Record Customer;
                    CDSCust: Record "CRM Account";
                    Contact: Record Contact;
                    CDSContact: Record "CRM Contact";
                    CustPrice: Record "Customer Price Group";
                    CDSCustPrice: Record "CRM Pricelevel";
                    ItemVendor: Record "Item Vendor";
                    CDSProductVendor: Record "CRM Product Vendor";
                    Salesheader: Record "Sales Header";
                    CDSSalesOrder: Record "CRM Salesorder";
                    IntegrationTableMappingName: Code[20];
                    IntegrationFieldMapping: Record "Integration Field Mapping";
                    IntegrationTableMapping: Record "Integration Table Mapping";
                    CDSDataVerse: Record 5341;
                    PaymentTerms: Record "Payment Terms";
                begin
                    //Item - Product
                    IntegrationTableMappingName := 'ITEM-PRODUCT';
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("Description 2"), CDSItem.FieldNo("Description 2"),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //Item -
                end;
            }
            action("Mapping Table CDS-Item Part Code")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ParentItem: Record "Parent Items";
                    CDSParentItem: Record "CRM Parent Items";
                    OEM: Record OEM;
                    CDSOEM: Record "CRM OEM";
                    Item: Record Item;
                    CDSItem: Record "CRM Product";
                    Countries: Record "Country/Region";
                    CDSCountry: Record "CRM Country";
                    Customer: Record Customer;
                    CDSCust: Record "CRM Account";
                    Contact: Record Contact;
                    CDSContact: Record "CRM Contact";
                    CustPrice: Record "Customer Price Group";
                    CDSCustPrice: Record "CRM Pricelevel";
                    ItemVendor: Record "Item Vendor";
                    CDSProductVendor: Record "CRM Product Vendor";
                    Salesheader: Record "Sales Header";
                    CDSSalesOrder: Record "CRM Salesorder";
                    IntegrationTableMappingName: Code[20];
                    IntegrationFieldMapping: Record "Integration Field Mapping";
                    IntegrationTableMapping: Record "Integration Table Mapping";
                    CDSDataVerse: Record 5341;
                    PaymentTerms: Record "Payment Terms";
                begin
                    //Item - Product
                    IntegrationTableMappingName := 'ITEM-PRODUCT';
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Item.FieldNo("Part Code"), CDSItem.FieldNo("Part No."),
                    IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //Item -
                end;
            }
            action("Mapping Table CDS-Parent Item Part Code")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ParentItem: Record "Parent Items";
                    CDSParentItem: Record "CRM Parent Items";
                    OEM: Record OEM;
                    CDSOEM: Record "CRM OEM";
                    Item: Record Item;
                    CDSItem: Record "CRM Product";
                    Countries: Record "Country/Region";
                    CDSCountry: Record "CRM Country";
                    Customer: Record Customer;
                    CDSCust: Record "CRM Account";
                    Contact: Record Contact;
                    CDSContact: Record "CRM Contact";
                    CustPrice: Record "Customer Price Group";
                    CDSCustPrice: Record "CRM Pricelevel";
                    ItemVendor: Record "Item Vendor";
                    CDSProductVendor: Record "CRM Product Vendor";
                    Salesheader: Record "Sales Header";
                    CDSSalesOrder: Record "CRM Salesorder";
                    IntegrationTableMappingName: Code[20];
                    IntegrationFieldMapping: Record "Integration Field Mapping";
                    IntegrationTableMapping: Record "Integration Table Mapping";
                    CDSDataVerse: Record 5341;
                    PaymentTerms: Record "Payment Terms";
                    FeildMapping: Record "Integration Field Mapping";
                begin
                    //Parent Item +
                    IntegrationTableMappingName := 'Parent Items';
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                                      ParentItem.FieldNo("Part Code"), CDSParentItem.FieldNo("Part No."),
                                      IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);


                    //Parent Item -
                end;
            }
            action("Mapping Table Customer & Vendor No")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ParentItem: Record "Parent Items";
                    CDSParentItem: Record "CRM Parent Items";
                    OEM: Record OEM;
                    CDSOEM: Record "CRM OEM";
                    Item: Record Item;
                    CDSItem: Record "CRM Product";
                    Countries: Record "Country/Region";
                    CDSCountry: Record "CRM Country";
                    Customer: Record Customer;
                    Vendor: Record Vendor;
                    CDSCust: Record "CRM Account";
                    Contact: Record Contact;
                    CDSContact: Record "CRM Contact";
                    CustPrice: Record "Customer Price Group";
                    CDSCustPrice: Record "CRM Pricelevel";
                    ItemVendor: Record "Item Vendor";
                    CDSProductVendor: Record "CRM Product Vendor";
                    Salesheader: Record "Sales Header";
                    CDSSalesOrder: Record "CRM Salesorder";
                    IntegrationTableMappingName: Code[20];
                    IntegrationFieldMapping: Record "Integration Field Mapping";
                    IntegrationTableMapping: Record "Integration Table Mapping";
                    CDSDataVerse: Record 5341;
                    PaymentTerms: Record "Payment Terms";
                begin
                    //VENDOR+
                    IntegrationTableMappingName := 'VENDOR';
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Vendor.FieldNo("No."), CDSCust.FieldNo(AccountNumber),
                    IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    //VENDOR-
                    //CUSTOMER+
                    IntegrationTableMappingName := 'CUSTOMER';
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    Customer.FieldNo("No."), CDSCust.FieldNo(AccountNumber),
                    IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    //CUSTOMER-
                end;
            }

            action("Mapping Table CDS-Parent Item")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ParentItem: Record "Parent Items";
                    CDSParentItem: Record "CRM Parent Items";
                    OEM: Record OEM;
                    CDSOEM: Record "CRM OEM";
                    Item: Record Item;
                    CDSItem: Record "CRM Product";
                    Countries: Record "Country/Region";
                    CDSCountry: Record "CRM Country";
                    Customer: Record Customer;
                    CDSCust: Record "CRM Account";
                    Contact: Record Contact;
                    CDSContact: Record "CRM Contact";
                    CustPrice: Record "Customer Price Group";
                    CDSCustPrice: Record "CRM Pricelevel";
                    ItemVendor: Record "Item Vendor";
                    CDSProductVendor: Record "CRM Product Vendor";
                    Salesheader: Record "Sales Header";
                    CDSSalesOrder: Record "CRM Salesorder";
                    IntegrationTableMappingName: Code[20];
                    IntegrationFieldMapping: Record "Integration Field Mapping";
                    IntegrationTableMapping: Record "Integration Table Mapping";
                    CDSDataVerse: Record 5341;
                    PaymentTerms: Record "Payment Terms";
                //Direction: Options  'Bidirectional,ToIntegrationTable,FromIntegrationTable';

                begin
                    // // //CUSTPRCGRP-PRICE +
                    // // IntegrationTableMappingName := 'CUSTPRCGRP-PRICE';

                    // // InsertIntegrationTableMapping(
                    // //             IntegrationTableMapping, IntegrationTableMappingName,
                    // //             DATABASE::"Customer Price Group", DATABASE::"CRM Pricelevel",
                    // //             CDSCustPrice.FieldNo(PriceLevelId), CDSCustPrice.FieldNo(PriceLevelId),
                    // //             '', '', false);

                    // // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // // CustPrice.FieldNo(Code), CDSCustPrice.FieldNo(Name),
                    // // IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
                    // // //CUSTPRCGRP-PRICE -

                    // //Item - Product
                    // IntegrationTableMappingName := 'ITEM-PRODUCT';
                    // // InsertIntegrationTableMapping(
                    // //             IntegrationTableMapping, IntegrationTableMappingName,
                    // //             DATABASE::Item, DATABASE::"CRM Product",
                    // //             // Item.FieldNo("No."), CDSItem.FieldNo(ProductId),
                    // //             CDSItem.FieldNo(ProductId), CDSItem.FieldNo(ModifiedOn),
                    // //             '', '', false);

                    // // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // // Item.FieldNo("No."), CDSItem.FieldNo(ProductNumber),
                    // // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // // Item.FieldNo(Description), CDSItem.FieldNo(Name),
                    // // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // // Item.FieldNo("Base Unit of Measure"), CDSItem.FieldNo(DefaultUoMId),
                    // // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);

                    // // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // // Item.FieldNo("Unit Cost"), CDSItem.FieldNo(StandardCost),
                    // // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // // Item.FieldNo("Unit Volume"), CDSItem.FieldNo(StockVolume),
                    // // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // // Item.FieldNo("Gross Weight"), CDSItem.FieldNo(StockWeight),
                    // // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("Vendor No."), CDSItem.FieldNo(VendorID),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("Vendor Item No."), CDSItem.FieldNo(VendorName),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // // Item.FieldNo(Inventory), CDSItem.FieldNo(QuantityOnHand),
                    // // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo(Condition), CDSItem.FieldNo(Condition),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("Parent Item Id"), CDSItem.FieldNo("Parent Item GUID"),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("Market Average"), CDSItem.FieldNo("Market Average"),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("Competitor Average"), CDSItem.FieldNo("Competitor Average"),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("Recommended Price"), CDSItem.FieldNo("Recommended Price"),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo(Type), CDSItem.FieldNo(msdyn_fieldserviceproducttype),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);

                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("Qty. on Sales Order"), CDSItem.FieldNo(new_QuantityonSalesOrder),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);

                    // //     InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // //   Item.FieldNo(Inventory), CDSItem.FieldNo(new_quantityavailable),
                    // //   IntegrationFieldMapping.Direction::Bidirectional, '', true, false);

                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("OEM Code"), CDSItem.FieldNo(OEM),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);

                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo(EAN), CDSItem.FieldNo(EAN),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);

                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Item.FieldNo("Country/Region of Origin Code"), CDSItem.FieldNo(new_CountryofOrigin),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // //Item -


                    // // //Payment Terms +
                    // // IntegrationTableMappingName := 'PAYMENT TERMS';

                    // // InsertIntegrationTableMapping(
                    // //             IntegrationTableMapping, IntegrationTableMappingName,
                    // //             DATABASE::"Payment Terms", 5341,
                    // //             CDSDataVerse.FieldNo(PaymentTermsCodeEnum), CDSDataVerse.FieldNo(PaymentTermsCodeEnum),
                    // //             '', '', false);

                    // // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // // PaymentTerms.FieldNo(Code), CDSDataVerse.FieldNo(PaymentTermsCodeEnum),
                    // // IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
                    // // //Payment Terms -

                    // //Country +
                    // IntegrationTableMappingName := 'Country';

                    // InsertIntegrationTableMapping(
                    //             IntegrationTableMapping, IntegrationTableMappingName,
                    //             DATABASE::"Country/Region", DATABASE::"CRM Country",
                    //             // Item.FieldNo("No."), CDSItem.FieldNo(ProductId),
                    //             Countries.FieldNo(SystemId), CDSCountry.FieldNo(SystemId),
                    //             '', '', false);

                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Countries.FieldNo(Code), CDSCountry.FieldNo(Code),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Countries.FieldNo(Name), CDSCountry.FieldNo(Name),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Countries.FieldNo("ISO Code"), CDSCountry.FieldNo("ISO Code"),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Countries.FieldNo("ISO Numeric Code"), CDSCountry.FieldNo("ISO Numeric Code"),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Countries.FieldNo("EU Country/Region Code"), CDSCountry.FieldNo("EU Country/Region Code"),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Countries.FieldNo("Intrastat Code"), CDSCountry.FieldNo("Intrastat Code"),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Countries.FieldNo("VAT Scheme"), CDSCountry.FieldNo("VAT Scheme"),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // Countries.FieldNo("Last Modified Date Time"), CDSCountry.FieldNo("Last Modified Date Time"),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // //Country -

                    // //OEM +
                    // IntegrationTableMappingName := 'OEM';

                    // InsertIntegrationTableMapping(
                    //     IntegrationTableMapping, IntegrationTableMappingName,
                    //             DATABASE::OEM, DATABASE::"CRM OEM",
                    //             OEM.FieldNo(Name), CDSOEM.FieldNo(Name),
                    //             '', '', false);

                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // OEM.FieldNo(Code), CDSOEM.FieldNo(Code),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // OEM.FieldNo(Name), CDSOEM.FieldNo(Name),
                    // IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    // //OEM -

                    //Parent Item +
                    IntegrationTableMappingName := 'Parent Items';

                    //         InsertIntegrationTableMapping(
                    //                     IntegrationTableMapping, IntegrationTableMappingName,
                    //                     DATABASE::"Parent Items", DATABASE::"CRM Parent Items",
                    //                     // ParentItem.FieldNo("No."), CDSParentItem.FieldNo("No."),
                    //                     CDSParentItem.FieldNo(new_productparentitemId), CDSParentItem.FieldNo(ModifiedOn),
                    //                     '', '', false);

                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("No."), CDSParentItem.FieldNo("No."),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo(Description), CDSParentItem.FieldNo(Description),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Description 2"), CDSParentItem.FieldNo("Description 2"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Search Description"), CDSParentItem.FieldNo("Search Description"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Automatic Ext. Texts"), CDSParentItem.FieldNo("Automatic Ext. Texts"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Basic Unit of Meassure"), CDSParentItem.FieldNo("Basic Unit of Meassure"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo(OEM), CDSParentItem.FieldNo(OEM),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo(EAN), CDSParentItem.FieldNo(EAN),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo(GTIN), CDSParentItem.FieldNo(GTIN),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Net Weight"), CDSParentItem.FieldNo("Net Weight"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Gross Weight"), CDSParentItem.FieldNo("Gross Weight"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Unit Volume"), CDSParentItem.FieldNo("Unit Volume"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Tariff No."), CDSParentItem.FieldNo("Tariff No."),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Import Tariff Code"), CDSParentItem.FieldNo("Import Tariff Code"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Export Tariff Code"), CDSParentItem.FieldNo("Export Tariff Code"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Available New"), CDSParentItem.FieldNo("Available New"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Available Refurbished"), CDSParentItem.FieldNo("Available Refurbished"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Available Used"), CDSParentItem.FieldNo("Available Used"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("UOM Group"), CDSParentItem.FieldNo("UOM Group"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Search Description"), CDSParentItem.FieldNo("Search Description"),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    //         ParentItem.FieldNo("Available New Open Box"), CDSParentItem.FieldNo(new_newopenboxconditionavailable),
                    //         IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //         InsertIntegrationFieldMapping(IntegrationTableMappingName,
                    // ParentItem.FieldNo("Parent Item"), CDSParentItem.FieldNo(new_productparentitemId),
                    // IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                   ParentItem.FieldNo("UOM ID"), CDSParentItem.FieldNo("UOM GUID"),
                   IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    InsertIntegrationFieldMapping(IntegrationTableMappingName,
                  ParentItem.FieldNo("UOM Group ID"), CDSParentItem.FieldNo("UOM Group GUID"),
                  IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
                    //Parent Item -
                end;
            }
        }
    }
    local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::ToIntegrationTable, 'CDS');
    end;

    procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
            ConstValue, ValidateField, ValidateIntegrationTableField);
    end;
}
