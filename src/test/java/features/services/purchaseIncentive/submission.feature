Feature: Verify Services.PurchaseIncentive.Submission


  @purchaseIncentive  @submission @createSubmission
  Scenario: Verify create submission
    Given I am getting existing engage record details
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
    #Create submission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                    |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmission |
    And I send a request to create submission for purchase incentive
      | participantKey | participantHouseholdKey        | reasonsForReview | invoiceKey         | invoiceDate                 | submittedOn                 | submissionType | metadataKey | metadataValue |
      | participantKey | participantHouseholdKey<rstr8> | reason_<rstr8>   | invoiceKey_<rstr5> | 2022-11-17T19:19:02.5652689 | 2023-03-03T14:07:15.3845284 | Online         | API         | Automation    |
    Then I should see the submission created successfully with response status code as 201

  @purchaseIncentive  @submission @createHandledSubmission
  Scenario: Verify create handled submission and claim
    Given I am getting existing engage record details
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
      | ruleKey                  | offeringKey         | name              | description                           | termsUrl                          | arvCalculationRuleKey        | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey_<rstr8> | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms | arvCalculationRuleKey<rstr6> | API_Automation | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
    #Create handled submission and claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createHandledSubmissionAndClaim |
    And I send request for create handled submission and claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | participantKey | desiredOfferKey | participantHouseholdKey     |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2023-10-10T18:42:34.2923495 | 2020-07-23T12:45:20.0447896 | participantKey | desiredOfferKey | participantHouseKey_<rstr8> |
    Then I should see the handled submission created successfully with status code as 200

  @purchaseIncentive  @submission @createClaimWithQualifiedSelection
  Scenario: Verify create claim with qualified selection
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
      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2022 12:00:00.000     | 12/3/2022 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
    #Create submission and claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionAndClaim |
    And I send request for create submission and claim with no review required
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate               | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-12T12:45:20.0447896 | 2020-04-12T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> |
    Then I should see submission and claim created successfully with status code as 200
    #Continue claim process with submissionClaimKey
    When I am able to get the following API endpoint
      | url                                           | endpoint                                                    |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.submissionWithQualifiedSelection |
    And I send request qualified selection using submissionClaimKey
      | offerKey |
      | offerKey |
    Then I should see the claim process with qualified selection is successful with status code as 204


  @purchaseIncentive  @submission @createSubmissionAndClaim
  Scenario: Verify create submission and claim
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
      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2022 12:00:00.000     | 12/3/2022 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
     #Create submission and claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionAndClaim |
    And I send request for create submission and claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     | reasonsForReview|
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2023-10-10T18:42:34.2923495 | 2020-07-23T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> |  testReview     |
    Then I should see submission and claim created successfully with status code as 200

  @purchaseIncentive  @submission @getOffersBySubmissionClaimKey
  Scenario: Verify get offers by submissionClaimKey
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
      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2020 12:00:00.000     | 8/3/2020 12:00:00.000     | 12/3/2020 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2020 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
     #Create submission and claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionAndClaim |
    And I send request for create submission and claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     | reasonsForReview|
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 | 2020-04-10T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> |  testReview     |
    Then I should see submission and claim created successfully with status code as 200
    #Get Offers by submission claim key
    When I am able to get the following API endpoint
      | url                                           | endpoint                                                 |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getOffersBysubmissionClaimKey |
    And I send request for get offers by submissionClaimKey
    Then I should see a list of offers in response with status code as 200

  @purchaseIncentive  @submission @getPendingReviews
  Scenario: Verify get pending reviews
    Given I am getting the participant token for the "PurchaseIncentive" scope
#    #Create Access Group
#    When I am able to get the following API endpoint
#      | url                     | endpoint                                      |
#      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
#    And I send request for create access group with below details
#      | wardKey | name               | description                                            | engagementKeys |
#      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
#    Then I should see the access group created successfully status code as 200
#    #Add team to the access group
#    When I am able to get the following API endpoint
#      | url                     | endpoint                                  |
#      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
#    And I send request for add team to the access group
#      | teamKey                  |
#      | 5d41e069c1022fc940c97440 |
#    Then I should see the response with status code as 204
#    #Create Offering
#    When I am getting the trusted Identifier token for the "Offering" sub scope
#    And I am able to get the following API endpoint
#      | url                         | endpoint                         |
#      | servicesOfferingOfferingApi | services.offering.createOffering |
#    And I send request for create offering with below details
#      | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
#      | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
#    Then I should see the offering created successfully
#     #Create Participant
#    When I am able to get the following API endpoint and generate token for "Participant"
#      | url                               | endpoint                               |
#      | servicesParticipantParticipantApi | services.participant.createParticipant |
#    And I send request for Create Participant with below details
#      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
#      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
#    Then I should see participant created successfully
#    #Create purchase incentive
#    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
#      | url                                           | endpoint                                           |
#      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPurchaseIncentive |
#    And I send request for create purchase incentive with below details
#      | limitActionKey | participantClaimLimit | householdClaimLimit | offerClaimMode     | name        | description      | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
#      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2022 12:00:00.000     | 12/3/2022 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
#    Then I should see purchase incentive created successfully with status code 201
#    #Create offer
#    When I am able to get the following API endpoint
#      | url                                           | endpoint                               |
#      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
#    And I send a request to create offer
#      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
#      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
#    Then I should see the offer created successfully with response status code as 201
#     #Create submission and claim
#    When I am able to get the following API endpoint
#      | url                                           | endpoint                                            |
#      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionAndClaim |
#    And I send request for create submission and claim
#      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     |reasonsForReview|
#      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 | 2020-04-10T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> | testReview     |
#    Then I should see submission and claim created successfully with status code as 200
     #Get pending reviews
    When I am able to get the following API endpoint
      | url                                           | endpoint                                     |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getPendingReviews |
    And I send request for get pending reviews
    Then I should see a list of reviews in response with status code as 200

  @purchaseIncentive  @submission @createSubmissionOverride
  Scenario: Verify create submission override
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
    And I send request for create submission and claim with no review required
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 | 2020-04-10T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> |
    Then I should see submission and claim created successfully with status code as 200
     #Create submission override
    When I am able to get the following API endpoint
      | url                                           | endpoint                                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionOverride |
    And I send request to override submission with offerKey
      | originalSubmissionKey | participantKey | createdBy         |
      | originalSubmissionKey | participantKey | TestAPIAutomation |
    Then I should see the response with status code as 201 for "Create submission override"


  @purchaseIncentive  @submission @getRelatedSubmission
  Scenario: Verify get related submissions
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
      | 2              | 5                     | 5                   | MostValuable | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2022 12:00:00.000     | 12/3/2022 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
     #Create submission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                    |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmission |
    And I send a request to create submission for purchase incentive
      | participantKey | participantHouseholdKey        | reasonsForReview | invoiceKey         | invoiceDate                 | submittedOn                 | submissionType | metadataKey | metadataValue |
      | participantKey | participantHouseholdKey<rstr8> | reason_<rstr8>   | invoiceKey_<rstr5> | 2020-04-10T19:19:02.5652689 | 2020-04-10T14:07:15.3845284 | Online         | API         | Automation    |
    Then I should see the submission created successfully with response status code as 201
    #Get related submissions with submissionKey
    When I am able to get the following API endpoint
      | url                                           | endpoint                                         |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getRelatedSubmissions |
    And I send request for get related submissions
    Then I should see the response with related submissions and status code as 200

  @purchaseIncentive  @submission @updateReview
  Scenario: Verify update review
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
      | 2              | 5                     | 5                   | MostValuable | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2022 12:00:00.000     | 12/3/2022 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
     #Create submission and claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionAndClaim |
    And I send request for create submission and claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     | reasonsForReview|
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 | 2020-04-10T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> | TestReview      |
    Then I should see submission and claim created successfully with status code as 200
    #Update a review
    When I am getting the trusted Identifier token for the "PurchaseIncentive" sub scope
    And I am able to get the following API endpoint
      | url                                           | endpoint                                          |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.updateSubmissionReview |
    And I send a request to update a  submission review
      | statusReason     | status |
      | UpdateSuccessful | Passed |
    Then I should see the review updated successfully with status code as 200

  @purchaseIncentive  @submission @updateSubmissionClaim
  Scenario: Verify update submission claim
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
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     | reasonsForReview|
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2023-10-10T18:42:34.2923495 | 2020-07-23T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> | TestReview      |
    Then I should see submission and claim created successfully with status code as 200
   #Update submission claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                         |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.updateSubmissionClaim |
    And I send request to update submission claim
      | offerKey | offerTags         | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 |
      | offerKey | offerTags_<rstr8> | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2023-10-10T18:42:34.2923495 |
    Then I should see submission claim update successfully with status code as 204


  @purchaseIncentive  @submission @getSubmissionsByParticipantKeys
  Scenario: Verify get submissions by participant keys
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
      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/4/2020 12:00:00.000     | 4/5/2020 12:00:00.000     | 4/8/2020 12:00:00.000   | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
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
    And I send request for create submission and claim with no review required
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 | 2020-04-10T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> |
    Then I should see submission and claim created successfully with status code as 200
    #Get submission by participantKeys
    When I am able to get the following API endpoint
      | url                                           | endpoint                                                  |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getSubmissionsByparticipantKey |
    And I send request for get submissions by participant key
      | participantKey |
      | participantKey |
    Then I should see a list of submissions done by the given participant key with status code as 200


  @purchaseIncentive  @submission @canUserCreateSubmission
  Scenario: Verify can user create submission
    Given I am getting existing engage record details
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
     #Verify can user create submission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                              |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getCanUserCreateSubmission |
    And I send request to get can user create submission request
    Then I should see the response as "true" with status code as 200 for "Can user create submission"


  @purchaseIncentive  @submission @getSubmissionClaimByParticipantKey
  Scenario: Verify get submission claim by participant key
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
    And I send request for create submission and claim with no review required
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2023-10-10T18:42:34.2923495 | 2020-07-23T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> |
    Then I should see submission and claim created successfully with status code as 200
    #Get submission claim by participantKey
    When I am able to get the following API endpoint
      | url                                           | endpoint                                                      |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getSubmissionClaimByParticipantKey |
    And I send request to get submission claim by participant key
    Then I should see a list of submission claim for the given participant key with status code as 200

  @purchaseIncentive  @submission @getCustomerServiceOfferings
  Scenario: Verify get customer service offerings
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
    And I send request for create submission and claim with no review required
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 | submittedOn                 | submissionType | participantKey | desiredOfferKey | participantHouseholdKey     |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2023-10-10T18:42:34.2923495 | 2020-07-23T12:45:20.0447896 | MailIn         | participantKey | desiredOfferKey | participantHouseKey_<rstr8> |
    Then I should see submission and claim created successfully with status code as 200
    #Get customer service offering
    When I am able to get the following API endpoint
      | url                                           | endpoint                                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getCustomerServiceOfferings |
    And I send request to get customer service offerings
    Then I should see the offering details in response with status code as 200

  @purchaseIncentive  @submission @createClaim
  Scenario: Verify create submission claim
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
      | 2              | 5                     | 5                   | MostValuable | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2020 12:00:00.000     | 12/3/2020 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 12/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
    #Create submission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                    |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmission |
    And I send a request to create submission for purchase incentive
      | participantKey | participantHouseholdKey        | reasonsForReview | invoiceKey         | invoiceDate                 | submittedOn                 | submissionType | metadataKey | metadataValue |
      | participantKey | participantHouseholdKey<rstr8> | reason_<rstr8>   | invoiceKey_<rstr5> | 2020-04-10T19:19:02.5652689 | 2020-04-10T14:07:15.3845284 | Online         | API         | Automation    |
    Then I should see the submission created successfully with response status code as 201
    #Create claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.claimSubmission |
    And I send request to create submission claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 |
    Then I should see claim created successfully with status code as 201


  @purchaseIncentive  @submission @canUserCreateSubmissionWithlimit
  Scenario: Verify can user create submission with limit
    Given I am getting existing engage record details
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
     #Verify can user create submission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                              |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getCanUserCreateSubmissionWithLimit |
    And I send request to get can user create submission request
    Then I should see the response as "true" with status code as 200 for "Can user create submission with limit"

#  @purchaseIncentive  @submission @getRelatedSubmissionOverrides
#  Scenario: Verify get related submission overrides
#    Given I am getting existing engage record details
#     #Create Access Group
#    When I am able to get the following API endpoint
#      | url                     | endpoint                                      |
#      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
#    And I send request for create access group with below details
#      | wardKey | name               | description                                            | engagementKeys |
#      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
#    Then I should see the access group created successfully status code as 200
#    #Add team to the access group
#    When I am able to get the following API endpoint
#      | url                     | endpoint                                  |
#      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
#    And I send request for add team to the access group
#      | teamKey                  |
#      | 5d41e069c1022fc940c97440 |
#    Then I should see the response with status code as 204
#    #Create Offering
#    When I am getting the trusted Identifier token for the "Offering" sub scope
#    And I am able to get the following API endpoint
#      | url                         | endpoint                         |
#      | servicesOfferingOfferingApi | services.offering.createOffering |
#    And I send request for create offering with below details
#      | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
#      | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
#    Then I should see the offering created successfully
#     #Create Participant
#    When I am able to get the following API endpoint and generate token for "Participant"
#      | url                               | endpoint                               |
#      | servicesParticipantParticipantApi | services.participant.createParticipant |
#    And I send request for Create Participant with below details
#      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
#      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
#    Then I should see participant created successfully
#    #Create purchase incentive
#    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
#      | url                                           | endpoint                                           |
#      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPurchaseIncentive |
#    And I send request for create purchase incentive with below details
#      | limitActionKey | participantClaimLimit | householdClaimLimit | offerClaimMode     | name        | description      | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
#      | 2              | 5                     | 5                   | MostValuable | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2022 12:00:00.000     | 12/3/2022 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
#    Then I should see purchase incentive created successfully with status code 201
#    #Create offer
#    When I am able to get the following API endpoint
#      | url                                           | endpoint                               |
#      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
#    And I send a request to create offer
#      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
#      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
#    Then I should see the offer created successfully with response status code as 201
#    #Create submission
#    When I am able to get the following API endpoint
#      | url                                           | endpoint                                    |
#      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmission |
#    And I send a request to create submission for purchase incentive
#      | participantKey | participantHouseholdKey        | reasonsForReview | invoiceKey         | invoiceDate                 | submittedOn                 | submissionType | metadataKey | metadataValue |
#      | participantKey | participantHouseholdKey<rstr8> | reason_<rstr8>   | invoiceKey_<rstr5> | 2020-04-10T19:19:02.5652689 | 2020-04-10T14:07:15.3845284 | Online         | API         | Automation    |
#    Then I should see the submission created successfully with response status code as 201
#    #Create submission override
#    When I am able to get the following API endpoint
#      | url                                           | endpoint                                            |
#      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionOverride |
#    And I send request to override submission with offerKey
#      | originalSubmissionKey | participantKey | createdBy         |
#      | originalSubmissionKey | participantKey | TestAPIAutomation |
#    Then I should see the response with status code as 201 with submission override key
#   #Get related submission overrides with submissionKey
#    When I am able to get the following API endpoint
#      | url                                           | endpoint                                         |
#      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getRelatedSubmissionOverrides |
#    And I send request for get related submission overrides
#    Then I should see the response with related submission overrides with status code as 200

  @purchaseIncentive  @submission @createClaimOverride
  Scenario: Verify create claim override
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
      | 2              | 5                     | 5                   | MostValuable | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2020 12:00:00.000     | 12/3/2020 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 12/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
    #Create submission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                    |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmission |
    And I send a request to create submission for purchase incentive
      | participantKey | participantHouseholdKey        | reasonsForReview | invoiceKey         | invoiceDate                 | submittedOn                 | submissionType | metadataKey | metadataValue |
      | participantKey | participantHouseholdKey<rstr8> | reason_<rstr8>   | invoiceKey_<rstr5> | 2020-04-10T19:19:02.5652689 | 2020-04-10T14:07:15.3845284 | Online         | API         | Automation    |
    Then I should see the submission created successfully with response status code as 201
    #Create submission override
    When I am able to get the following API endpoint
      | url                                           | endpoint                                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionOverride |
    And I send request to override submission with offerKey
      | originalSubmissionKey | participantKey | createdBy         |
      | originalSubmissionKey | participantKey | TestAPIAutomation |
    Then I should see the response with status code as 201 with submission override key
   #Create claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.claimSubmission |
    And I send request to create submission claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 |
    Then I should see claim created successfully with status code as 201
    #Create claim override
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmissionClaimOverride |
    And I send request to create submission claim override
    |createdBy|offerTags|
    |TestAutomation|TestOffer|
    Then I should see claim override created successfully with status code as 201


  @purchaseIncentive  @submission @getClaimByFilter
  Scenario: Verify get claim by filter
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
      | 2              | 5                     | 5                   | MostValuable | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2020 12:00:00.000     | 12/3/2020 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 12/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
    #Create submission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                    |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmission |
    And I send a request to create submission for purchase incentive
      | participantKey | participantHouseholdKey        | reasonsForReview | invoiceKey         | invoiceDate                 | submittedOn                 | submissionType | metadataKey | metadataValue |
      | participantKey | participantHouseholdKey<rstr8> | reason_<rstr8>   | invoiceKey_<rstr5> | 2020-04-10T19:19:02.5652689 | 2020-04-10T14:07:15.3845284 | Online         | API         | Automation    |
    Then I should see the submission created successfully with response status code as 201
    #Create claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.claimSubmission |
    And I send request to create submission claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 |
    Then I should see claim created successfully with status code as 201
    #Get claims by filter
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getSubmissionClaimsByFilter |
    And I send request to get claims by filter
    Then I should see a list of claims in response with status code as 200

  @purchaseIncentive  @submission @getClaimByClaimKey
  Scenario: Verify get claim by submissionClaimKey
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
      | 2              | 5                     | 5                   | MostValuable | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2020 12:00:00.000     | 12/3/2020 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 12/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
    #Create submission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                    |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmission |
    And I send a request to create submission for purchase incentive
      | participantKey | participantHouseholdKey        | reasonsForReview | invoiceKey         | invoiceDate                 | submittedOn                 | submissionType | metadataKey | metadataValue |
      | participantKey | participantHouseholdKey<rstr8> | reason_<rstr8>   | invoiceKey_<rstr5> | 2020-04-10T19:19:02.5652689 | 2020-04-10T14:07:15.3845284 | Online         | API         | Automation    |
    Then I should see the submission created successfully with response status code as 201
    #Create claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.claimSubmission |
    And I send request to create submission claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 |
    Then I should see claim created successfully with status code as 201
    #Get claims by claim key
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getSubmissionClaimByClaimKey |
    And I send request to get claims by claim key
    Then I should see submission claim details in response with status code as 200


  @purchaseIncentive  @submission @getClaimsByParticipantKeys
  Scenario: Verify get claim by participant keys
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
      | 2              | 5                     | 5                   | MostValuable | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2020 12:00:00.000     | 12/3/2020 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 12/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
    #Create submission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                    |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmission |
    And I send a request to create submission for purchase incentive
      | participantKey | participantHouseholdKey        | reasonsForReview | invoiceKey         | invoiceDate                 | submittedOn                 | submissionType | metadataKey | metadataValue |
      | participantKey | participantHouseholdKey<rstr8> | reason_<rstr8>   | invoiceKey_<rstr5> | 2020-04-10T19:19:02.5652689 | 2020-04-10T14:07:15.3845284 | Online         | API         | Automation    |
    Then I should see the submission created successfully with response status code as 201
    #Create claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.claimSubmission |
    And I send request to create submission claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 |
    Then I should see claim created successfully with status code as 201
    #Get claims by claim key
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getSubmissionClaimsByParticipantKeys |
    And I send request to get claims by participant keys
    |participantKey|
    |participantKey|
    Then I should see claim details in response with status code as 200


  @purchaseIncentive  @submission @getClaimsBySubmissionKeys
  Scenario: Verify get claim by submission keys
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
      | 2              | 5                     | 5                   | MostValuable | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 8/2/2022 12:00:00.000     | 8/3/2020 12:00:00.000     | 12/3/2020 12:00:00.000  | 4/1/2020 12:00:00.000     | 12/4/2022 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createOffer |
    And I send a request to create offer
      | ruleKey                  | offeringKey | name              | description                           | termsUrl                                  | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 615490c0c870fd0128ca8d6d | offeringKey | Test Offer<rstr5> | Test offer created via API automation | https://myengagementurl.com/terms  | API_Automation | 4/10/2020 12:00:00.000    | 12/15/2020 12:00:00.000  |
    Then I should see the offer created successfully with response status code as 201
    #Create submission
    When I am able to get the following API endpoint
      | url                                           | endpoint                                    |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSubmission |
    And I send a request to create submission for purchase incentive
      | participantKey | participantHouseholdKey        | reasonsForReview | invoiceKey         | invoiceDate                 | submittedOn                 | submissionType | metadataKey | metadataValue |
      | participantKey | participantHouseholdKey<rstr8> | reason_<rstr8>   | invoiceKey_<rstr5> | 2020-04-10T19:19:02.5652689 | 2020-04-10T14:07:15.3845284 | Online         | API         | Automation    |
    Then I should see the submission created successfully with response status code as 201
    #Create claim
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.claimSubmission |
    And I send request to create submission claim
      | invoiceKey         | purchaseMode | retailerName | retailerLocation     | retailerAddressLine1 | retailerAddressLine2 | retailerCity | retailerState | retailerPostalCode | retailerCountryCode | retailerPhone | invoiceItemType | invoiceName | invoiceOption | sku         | brand     | category     | productName | upc         | invoiceDate                 |
      | invoiceKey_<rstr5> | Default      | TestRetailer | TestRetailerLocation | TestAddressLine1     | TestAddressLine2     | Phoenix      | Arizona       | 85018              | US                  | 602-437-5392  | Test            | TestInvoice | Email         | SKU_<rstr6> | TestBrand | TestCategory | TestProduct | UPC_<rstr5> | 2020-04-10T18:42:34.2923495 |
    Then I should see claim created successfully with status code as 201
    #Get claims by submision keys
    When I am able to get the following API endpoint
      | url                                           | endpoint                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getClaimsBySubmissionKeys |
    And I send request to get claims by submission keys
    Then I should see claims in response with status code as 200



