codeunit 50000 "Master Company Mgt."
{
    trigger OnRun()
    begin
        InsertParentItemsFromMasterCompany();
        InsertItemsFromMasterCompany();
        // InsertVendorFromMasterCompany();
        // InsertCustomerFromMasterCompany();
    end;

    //Parent Item Insert +
    local procedure InsertItemsFromMasterCompany()
    var
        ItemRec: Record Item;
        CompanyInfo: Record "Company Information";
        companiesRec: Record Company;
        CurrentCompanyName: Text;
        Rec: Record Item;
        NewDateAndTime: DateTime;
        Newtime: Time;
    begin
        Newtime := Time - 60000;
        NewDateAndTime := CreateDateTime(Today, Newtime);

        Rec.Reset();
        Rec.SetFilter(SystemModifiedAt, '<%1', NewDateAndTime);
        if Rec.FindSet() then begin
            repeat
                // Error('%1...%2...%3...%4', Time, Newtime, NewDateAndTime, Rec.SystemModifiedAt);
                if Rec.SystemModifiedAt < CurrentDateTime then begin
                    CompanyInfo.get();
                    if CompanyInfo."Master Company" = true then begin
                        if companiesRec.Find('-') then
                            repeat
                                ItemRec.ChangeCompany(companiesRec.Name);
                                if not ItemRec.Get(Rec."No.") then begin
                                    ItemRec.Init();
                                    ItemRec.TransferFields(Rec);
                                    if ItemRec.Insert() then;
                                end;
                            until companiesRec.Next() = 0;
                    end;
                end;
            until rec.Next() = 0;
        end;
    end;
    //Parent Item Insert -

    //Item Insert +
    local procedure InsertParentItemsFromMasterCompany()
    var
        ParentItemRec: Record "Parent Items";
        CompanyInfo: Record "Company Information";
        companiesRec: Record Company;
        CurrentCompanyName: Text;
        CounterLvar: Integer;
        Rec: Record "Parent Items";
        NewDateAndTime: DateTime;
        Newtime: Time;

    begin
        //NewDateAndTime := CurrentDateTime + 
        Newtime := Time - 60000;
        NewDateAndTime := CreateDateTime(Today, Newtime);

        Rec.Reset();
        Rec.SetFilter(SystemModifiedAt, '<%1', NewDateAndTime);
        if Rec.FindSet() then begin
            repeat
                // Error('%1...%2...%3...%4', Time, Newtime, NewDateAndTime, Rec.SystemModifiedAt);
                if Rec.SystemModifiedAt < CurrentDateTime then begin
                    CompanyInfo.get();
                    if CompanyInfo."Master Company" = true then begin
                        if companiesRec.Find('-') then
                            repeat
                                ParentItemRec.ChangeCompany(companiesRec.Name);
                                if not ParentItemRec.Get(Rec."No.") then begin
                                    ParentItemRec.Init();
                                    // ParentItemRec.TransferFields(Rec);
                                    // ParentItemRec := rec;
                                    ParentItemRec.Copy(Rec);
                                    if ParentItemRec.Insert() then;
                                end;
                            until companiesRec.Next() = 0;
                    end;
                end;
            until Rec.Next() = 0;
        end;
    end;
    //Item Insert -

    //Vendor Insert +
    /*  local procedure InsertVendorFromMasterCompany()
      var
          VendorRec: Record Vendor;
          CompanyInfo: Record "Company Information";
          companiesRec: Record Company;
          CurrentCompanyName: Text;
          Rec: Record Vendor;
          NewDateAndTime: DateTime;
          Newtime: Time;
      begin
          //NewDateAndTime := CurrentDateTime + 
          Newtime := Time - 60000;
          NewDateAndTime := CreateDateTime(Today, Newtime);

          Rec.Reset();
          Rec.SetFilter(SystemModifiedAt, '<%1', NewDateAndTime);
          if Rec.FindSet() then begin
              repeat
                  // Error('%1...%2...%3...%4', Time, Newtime, NewDateAndTime, Rec.SystemModifiedAt);
                  if Rec.SystemModifiedAt < CurrentDateTime then begin
                      CompanyInfo.get();
                      if CompanyInfo."Master Company" = true then begin
                          if companiesRec.Find('-') then
                              repeat
                                  VendorRec.ChangeCompany(companiesRec.Name);
                                  if not VendorRec.Get(Rec."No.") then begin
                                      VendorRec.Init();
                                      VendorRec.TransferFields(Rec);
                                      if VendorRec.Insert() then;
                                  end;
                              until companiesRec.Next() = 0;
                      end;
                  end;
              until Rec.Next() = 0;
          end;
      end;
      //Vendor Insert -

      //Customer Insert +
      local procedure InsertCustomerFromMasterCompany()
      var
          CustomerRec: Record Customer;
          CompanyInfo: Record "Company Information";
          Rec: Record Customer;
          NewDateAndTime: DateTime;
          Newtime: Time;
          companiesRec: Record Company;
      begin
          //NewDateAndTime := CurrentDateTime + 
          Newtime := Time - 60000;
          NewDateAndTime := CreateDateTime(Today, Newtime);

          Rec.Reset();
          Rec.SetFilter(SystemModifiedAt, '<%1', NewDateAndTime);
          if Rec.FindSet() then begin
              repeat
                  // Error('%1...%2...%3...%4', Time, Newtime, NewDateAndTime, Rec.SystemModifiedAt);
                  if Rec.SystemModifiedAt < CurrentDateTime then begin
                      CompanyInfo.get();
                      if CompanyInfo."Master Company" = true then begin
                          if companiesRec.Find('-') then
                              repeat
                                  CustomerRec.ChangeCompany(companiesRec.Name);
                                  if not CustomerRec.Get(Rec."No.") then begin
                                      CustomerRec.Init();
                                      CustomerRec.TransferFields(Rec);
                                      if CustomerRec.Insert() then;
                                  end;
                              until companiesRec.Next() = 0;
                      end;
                  end;
              until Rec.Next() = 0;
          end;
      end;*/
    //Customer Insert -
}