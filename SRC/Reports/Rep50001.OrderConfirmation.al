report 50001 "Order Confirmation"
{
    UsageCategory = Documents;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'SRC/Layout/OrderConfirmation.rdl';
    EnableHyperlinks = true;
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            // DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            // RequestFilterFields = "No.";
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.";
            RequestFilterHeading = 'Sales Order';
            column(CompName; CompanyInfo.name)
            {
            }
            column(No_Order; "No.")
            {
            }
            column(OrderNoLbl; OrderNoLbl)
            {
            }
            column(Remark; Remark)
            {
            }
            column(CompPicture; CompanyInfo.Picture)
            {
            }
            column(CompAddress1; CompanyInfo.Address)
            {
            }
            column(CompAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompCity; CompanyInfo.City)
            {
            }
            column(CompState; CompanyInfo.County)
            {
            }
            column(CompPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompCountry; CompanyInfo."Country/Region Code")
            {
            }
            column(CompanyAddr1; CompanyAddr[1])
            {
            }
            column(CompanyAddr2; CompanyAddr[2])
            {
            }
            column(CompanyAddr3; CompanyAddr[3])
            {
            }
            column(CompanyAddr4; CompanyAddr[4])
            {
            }
            column(CompanyAddr5; CompanyAddr[5])
            {
            }
            column(CompanyAddr6; CompanyAddr[6])
            {
            }
            column(CompanyAddr7; CompanyAddr[7])
            {
            }
            column(CompanyAddr8; CompanyAddr[8])
            {
            }
            column(SalesHeaderSelltoAddr1; SalesHeaderSelltoAddr[1])
            {
            }
            column(SalesHeaderSelltoAddr2; SalesHeaderSelltoAddr[2])
            {
            }
            column(SalesHeaderSelltoAddr3; SalesHeaderSelltoAddr[3])
            {
            }
            column(SalesHeaderSelltoAddr4; SalesHeaderSelltoAddr[4])
            {
            }
            column(SalesHeaderSelltoAddr5; SalesHeaderSelltoAddr[5])
            {
            }
            column(SalesHeaderSelltoAddr6; SalesHeaderSelltoAddr[6])
            {
            }
            column(SalesHeaderSelltoAddr7; SalesHeaderSelltoAddr[7])
            {
            }
            column(SalesHeaderSelltoAddr8; SalesHeaderSelltoAddr[8])
            {
            }
            column(SalesHeaderShiptoAddr1; SalesHeaderShiptoAddr[1])
            {
            }
            column(SalesHeaderShiptoAddr2; SalesHeaderShiptoAddr[2])
            {
            }
            column(SalesHeaderShiptoAddr3; SalesHeaderShiptoAddr[3])
            {
            }
            column(SalesHeaderShiptoAddr4; SalesHeaderShiptoAddr[4])
            {
            }
            column(SalesHeaderShiptoAddr5; SalesHeaderShiptoAddr[5])
            {
            }
            column(SalesHeaderShiptoAddr6; SalesHeaderShiptoAddr[6])
            {
            }
            column(SalesHeaderShiptoAddr7; SalesHeaderShiptoAddr[7])
            {
            }
            column(SalesHeaderShiptoAddr8; SalesHeaderShiptoAddr[8])
            {
            }
            column(CompVATRegNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompHomePage; CompanyInfo."Home Page")
            {
            }
            column(CompRegNo; CompanyInfo."Registration No.")
            {
            }
            column(CompBank; BankName)
            {
            }
            column(IBAN; IBAN)
            {
            }
            column(Swift; SWift)
            {
            }
            column(Account; AccountNo)
            {
            }
            column(SortCode; SortCode)
            {
            }
            column(GLSetUpLCYCode; GLSetUp."LCY Code")
            {
            }
            column(QuoteNO; "Quote No.")
            {
            }
            column(Quote_No_; "Quote No.")
            {
            }
            column(OrderQryEmail; "Sales&RecSetUp".Email)
            {
            }
            column(External_Document_No_; "Your Reference")
            {
            }
            column(Order_Date; "Order Date")
            {
            }
            column(Sell_to_Address; "Sell-to Address")
            {
            }
            column(Sell_to_Address_2; "Sell-to Address 2")
            {
            }
            column(Sell_to_City; "Sell-to City")
            {
            }
            column(Sell_to_Country_Region_Code; "Sell-to Country/Region Code")
            {
            }
            column(Sell_to_County; "Sell-to County")
            {
            }
            column(Sell_to_Post_Code; "Sell-to Post Code")
            {
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {
            }
            column(Ship_to_Address; "Ship-to Address")
            {
            }
            column(Ship_to_Address_2; "Ship-to Address 2")
            {
            }
            column(Ship_to_City; "Ship-to City")
            {
            }
            column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code")
            {
            }
            column(Ship_to_County; "Ship-to County")
            {
            }
            column(Ship_to_Name; "Ship-to Name")
            {
            }
            column(Ship_to_Post_Code; "Ship-to Post Code")
            {
            }
            column(Ship_to_Contact; "Ship-to Contact")
            {
            }
            column(Payment_Terms_Code; "Payment Terms Code")
            {
            }
            column(TitleLbl; TitleLbl)
            {
            }
            column(ThankYouLbl; ThankYouLbl)
            {
            }
            column(InvoiceAddrLbl; InvoiceAddrLbl)
            {
            }
            column(DeliveryAddrLbl; DeliveryAddrLbl)
            {
            }
            column(OrderDetailsLbl; OrderDetailsLbl)
            {
            }
            column(PaymentTermsLbl; PaymentTermsLbl)
            {
            }
            column(OurQuoteLbl; OurQuoteLbl)
            {
            }
            column(YourQuoteLbl; YourQuoteLbl)
            {
            }
            column(ConfDateLbl; ConfDateLbl)
            {
            }
            column(ContactLbl; Contact)
            {
            }
            column(QtyLbl; QtyLbl)
            {
            }
            column(PartNoLbl; PartNoLbl)
            {
            }
            column(ConditionLbl; ConditionLbl)
            {
            }
            column(DlvryTimeLbl; DlvryTimeLbl)
            {
            }
            column(UnitpriceLbl; UnitpriceLbl)
            {
            }
            column(TotalLbl; TotalLbl)
            {
            }
            column(TotalHeadingLbl; TotalHeadingLbl)
            {
            }
            column(SubTOtalLbl; SubTOtalLbl)
            {
            }
            column(ShippingLbl; ShippingLbl)
            {
            }
            column(VATLbl; VATLbl)
            {
            }
            column(FixedLbl1; FixedLbl1)
            {
            }
            column(FixedLbl2; FixedLbl2)
            {
            }
            column(FixedLbl3; FixedLbl3)
            {
            }
            column(FixedLbl4; FixedLbl4)
            {
            }
            column(TermsCondLINK; TermsCondLINK)
            {

            }
            column(PaymentDtlsLbl; PaymentDtlsLbl)
            {
            }
            column(WeAcceptLbl; WeAcceptLbl)
            {
            }
            column(BankLbl; BankLbl)
            {
            }
            column(IBANLbl; IBANLbl)
            {
            }
            column(SwiftLbl; SwiftLbl)
            {
            }
            column(AccountLbl; AccountLbl)
            {
            }
            column(SortCodeLbl; SortCodeLbl)
            {
            }
            column(PayPalLbl; PayPalLbl)
            {
            }
            column(PayPalEmail; PayPalEmail)
            {
            }
            column(OrderQuriesLbl; OrderQuriesLbl)
            {
            }
            column(CompanyRegLbl; CompanyRegLbl)
            {
            }
            column(VATRegNoLbl; VATRegNoLbl)
            {
            }
            column(TelNoLbl; TelNoLbl)
            {
            }
            column(FooterLbl1; FooterLbl1)
            {
            }
            column(ToAvoidDelaylbl; ToAvoidDelaylbl)
            {
            }
            column(OnPaymentLbl; OnPaymentLbl)
            {
            }
            column(DaysLbl; DaysLbl)
            {
            }
            column(PageLbl; PageLbl)
            {
            }
            column(OfLbl; OfLbl)
            {
            }
            column(Symbol; Symbol)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = "Sales Header";
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(Document_No_; "Document No.")
                {
                }
                column(Line_No_; "Line No.")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Item_Reference_No_; "Item Reference No.")
                {
                }
                column(No_; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(OEM; OemTxt)
                {
                }
                column(PartCode; PartCode)
                {
                }
                column(Condition; Condition)
                {
                }
                column(Unit_Price; "Unit Price")
                {
                }
                column(RefNo; RefNo)
                {
                }
                column(Planned_Delivery_Date; "Planned Delivery Date")
                {
                }
                column(DeliveryTime; DeliveryTime)
                {
                }
                column(Amount_Including_VAT; "Amount Including VAT")
                {
                }
                column(Gbool; Gbool)
                {
                }
                column(VAT_Base_Amount; "VAT Base Amount")
                {
                }
                trigger OnAfterGetRecord()
                var
                    Item: Record Item;
                begin
                    Clear(Condition);
                    Clear(OemTxt);
                    Clear(Gbool);
                    Clear(PartCode);

                    if type = Type::Item then
                        Gbool := true
                    else
                        Gbool := false;

                    //SD-SB-25-JAN-22 +
                    // if Item.Get("No.") then begin
                    //     if Item."OEM Code" <> '' then
                    //         OemTxt := Item."OEM Code"
                    //     else
                    //         OemTxt := '';
                    if Itemgrec.Get("No.") then begin
                        if OEMREC.Get(Itemgrec."OEM Code") then
                            if OEMREC.Name <> '' then
                                OEMTxt := OEMREC.Name;

                        if Itemgrec."Part Code" <> '' then
                            PartCode := Itemgrec."Part Code";
                        //SD-SB-25-JAN-22 -

                        if (ItemGRec.Condition = ItemGRec.Condition::New) or (ItemGRec.Condition = ItemGRec.Condition::"New Open Box") or
                         (ItemGRec.Condition = ItemGRec.Condition::Refurbished) or (ItemGRec.Condition = ItemGRec.Condition::Repaired) or
                         (ItemGRec.Condition = ItemGRec.Condition::Used) then
                            Condition := Format(ItemGRec.Condition)
                        else
                            Condition := '';
                    end;
                    DeliveryTime := "Planned Delivery Date" - "Sales Header"."Order Date";
                end;
            }
            trigger OnAfterGetRecord()
            var

            begin
                Clear(BankName);
                Clear(IBAN);
                Clear(SWift);
                Clear(AccountNo);
                Clear(SortCode);
                Clear(Symbol);
                Clear(Contact);

                if ("Sales Header"."Currency Code" = 'USD') or ("Sales Header"."Currency Code" = 'EUR') then begin
                    if CurrencyGrec.get("Currency Code") then
                        Symbol := CurrencyGrec.Symbol;
                end else
                    Symbol := GLSetup."Local Currency Symbol";
                //SD-SB-25-JAN-22 +
                if "Ship-to Contact" <> '' then
                    Contact := 'Contact: ' + "Ship-to Contact"
                else
                    Contact := '';
                //SD-SB-25-JAN-22 -

                FormatAddr.SalesHeaderSellTo(SalesHeaderSelltoAddr, "Sales Header");
                FormatAddr.SalesHeaderShipTo(SalesHeaderShiptoAddr, CustAddr, "Sales Header");
                if "Sales Header"."Currency Code" <> '' then begin
                    BankAccount.Reset();
                    BankAccount.SetRange("Currency Code", "Currency Code");
                    BankAccount.SetRange("Reporting Bank", true);
                    if BankAccount.FindFirst() then begin
                        BankName := BankAccount.Name;
                        IBAN := BankAccount.IBAN;
                        SWift := BankAccount."SWIFT Code";
                        AccountNo := BankAccount."Bank Account No.";
                        SortCode := BankAccount."Bank Branch No."
                    end else begin
                        BankAccount.Reset();
                        BankAccount.SetRange("Currency Code", GLSetUp."LCY Code");
                        BankAccount.SetRange("Reporting Bank", true);
                        if BankAccount.FindFirst() then begin
                            BankName := BankAccount.Name;
                            IBAN := BankAccount.IBAN;
                            SWift := BankAccount."SWIFT Code";
                            AccountNo := BankAccount."Bank Account No.";
                            SortCode := BankAccount."Bank Branch No."
                        end;
                    end;
                end else begin
                    BankAccount.Reset();
                    BankAccount.SetRange("Currency Code", GLSetUp."LCY Code");
                    BankAccount.SetRange("Reporting Bank", true);
                    if BankAccount.FindFirst() then begin
                        BankName := BankAccount.Name;
                        IBAN := BankAccount.IBAN;
                        SWift := BankAccount."SWIFT Code";
                        AccountNo := BankAccount."Bank Account No.";
                        SortCode := BankAccount."Bank Branch No."
                    end;
                end;
            end;
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.get();
        "Sales&RecSetUp".Get();
        GLSetUp.Get();
        CompanyInfo.CalcFields(Picture);
        FormatAddr.GetCompanyAddr(RespCenterCode, ResponsibilityCenter, CompanyInfo, CompanyAddr);
    end;

    var
        OrderNoLbl: Label 'Order No:';
        OEMREC: Record OEM;
        ForRepair: Text;
        PartCode: Code[50];
        CurrencyGrec: Record Currency;
        Gbool: Boolean;
        BankName: Text;
        IBAN: Code[100];
        SWift: Code[100];
        AccountNo: Code[100];
        SortCode: code[100];
        CompanyInfo: Record "Company Information";
        "Sales&RecSetUp": Record "Sales & Receivables Setup";
        GLSetUp: Record "General Ledger Setup";
        Item: Record Item;
        ItemGRec: record Item;
        RefNo: Code[20];
        Desc: Text;
        CompanyAddr: array[8] of text[100];
        SalesHeaderSelltoAddr: array[8] of text[100];
        SalesHeaderShiptoAddr: array[8] of text[100];
        CustAddr: array[8] of text[100];
        FormatAddr: Codeunit "Format Address";
        DeliveryTime: Integer;
        OemTxt: Text;
        CnditionTxt: Text;
        BankAccount: Record "Bank Account";
        RespCenterCode: code[20];
        ResponsibilityCenter: Record "Responsibility Center";
        TitleLbl: Label 'ORDER CONFIRMATION';
        ThankYouLbl: Label 'Thank you for your order, which we confirm as follows:';
        InvoiceAddrLbl: Label 'INVOICE ADDRESS';
        DeliveryAddrLbl: Label 'DELIVERY ADDRESS';
        OrderDetailsLbl: Label 'ORDER DETAILS';
        PaymentTermsLbl: Label 'Payment Terms:';
        OurQuoteLbl: Label 'Our Quote:';
        YourQuoteLbl: Label 'Your Order:';
        ConfDateLbl: Label 'Confirmation Date:';
        Contact: Text;// 'Contact';
        QtyLbl: Label 'QTY';
        PartNoLbl: Label 'PART NUMBER';
        ConditionLbl: Label 'CONDITION';
        Condition: Text;
        DlvryTimeLbl: Label 'DELIVERY TIME';
        UnitpriceLbl: Label 'UNIT PRICE';
        TotalLbl: Label 'TOTAL';
        TotalHeadingLbl: Label 'Total';
        SubTOtalLbl: Label 'Sub total:';
        ShippingLbl: Label 'Shipping:';
        VATLbl: Label 'VAT:';
        FixedLbl1: Label 'Parts are supplied with factory default settings. Please let us know if you would like a quote for one of our engineers to help with configuration or commissioning.';
        FixedLbl2: Label 'All orders are subject to our terms and conditions of sale, available here:';
        FixedLbl3: Label 'If you have any queries relating to this order, please do not hesitate to contact us.';
        FixedLbl4: Label 'We appreciate your business!';
        PaymentDtlsLbl: Label 'Payment details:';
        WeAcceptLbl: Label 'We accept all major credit and debit cards.';
        BankLbl: Label 'Bank:';
        IBANLbl: Label 'IBAN:';
        SwiftLbl: Label 'SWIFT:';
        AccountLbl: Label 'Account:';
        SortCodeLbl: Label 'Sort Code:';
        PayPalLbl: Label 'PayPal';
        OrderQuriesLbl: Label 'Order Queries:';
        CompanyRegLbl: Label 'Company Registration:';
        VATRegNoLbl: Label 'VAT Reg No:';
        TelNoLbl: Label 'Tel No:';
        TermsCondLINK: Label 'https://nicontrols.com/Terms_and_Conditions_of_Sale.pdf';
        FooterLbl1: Label 'Prices are ex works unless stated otherwise and are in';
        PayPalEmail: Label 'paypal@nicontrols.com';
        ToAvoidDelaylbl: Label 'To avoid delays to your order, reference';
        OnPaymentLbl: Label 'on payment';
        DaysLbl: Label 'Days';
        PageLbl: Label 'Page';
        OfLbl: Label 'of';
        Symbol: Text;

}