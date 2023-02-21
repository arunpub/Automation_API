Feature: Verify Services.PurchaseIncentive.Resubmission

  @purchaseIncentive  @resubmission @createReSubmission
  Scenario: Verify create resubmission
    Given I am getting existing engage record details
    #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200
    #Add team to the access group
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      | teamKey                  |
      | 5d41e069c1022fc940c97440 |
    Then I should see the response with status code as 204
    #Create Offering
    When I am getting the trusted Identifier token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully
     #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create purchase incentive
    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
      | url                                           | endpoint                                           |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPurchaseIncentive |
    And I send request for create purchase incentive with below details
      | limitActionKey | participantClaimLimit | householdClaimLimit | offerClaimMode | name        | description      | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 2              | 5                     | 5                   | MostValuable   | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2020 12:00:00.000     | 12/3/2020 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                          | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms | API_Automation | 4/10/2020 12:00:00.000    | 12/15/2020 12:00:00.000 |
    Then I should see the offer created successfully with response status code as 201
     #Create submission and claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionAndClaim |
    And I send request for create submission and claim with no review required
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2021-12-10T18:42:34.2923495 | 2021-12-10T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> |
    Then I should see submission and claim created successfully with status code as 200
    #Create resubmission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                      |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createResubmission |
    And I send request for resubmission
      | invoiceKey         | invoiceDate                 | submittedOn                 | submissionType |
      | invoiceKey_<rstr5> | 2020-08-15T19:19:02.5652689 | 2020-08-15T14:07:15.3845284 | MailIn         |
    Then I should see the resubmission is completed successfully with status code as 201


  @purchaseIncentive  @resubmission @canUserResubmit
  Scenario: Verify can user resubmit
    Given I am getting existing engage record details
     #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200
    #Add team to the access group
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      | teamKey                  |
      | 5d41e069c1022fc940c97440 |
    Then I should see the response with status code as 204
    #Create Offering
    When I am getting the trusted Identifier token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully
    #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create purchase incentive
    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
      | url                                           | endpoint                                           |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPurchaseIncentive |
    And I send request for create purchase incentive with below details
      | limitActionKey | participantClaimLimit | householdClaimLimit | offerClaimMode     | name        | description      | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 4/4/2020 12:00:00.000     | 4/5/2020 12:00:00.000     | 4/8/2020 12:00:00.000   | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                          | arvCalculationRuleKey        | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms | arvCalculationRuleKey<rstr6> | API_Automation | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
    #Create submission and claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionAndClaim |
    And I send request for create submission and claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2023-10-10T18:42:34.2923495 | 2020-07-23T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> |
    Then I should see submission and claim created successfully with status code as 200
    #Verify can user resubmit
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.canUserResubmit |
    And I send request for verify can user resubmit
      | submittedOn                 |
      | 2023-02-01T12:51:07.6232311 |
    Then I should see the response as "false" with status code as 200 for "Can User Resubmit"




