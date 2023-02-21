Feature: Verify Services.PurchaseIncentive.Offer

  @purchaseIncentive  @offer @createAndGetOffer
  Scenario: Verify create and get offer
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
    #Get offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getOffer |
    And I send a request to get offer
    Then I should see offer details in response with status code as 200

  @purchaseIncentive  @offer @getOfferByPurchaseIncentiveKey
  Scenario: Verify get offers by purchase incentive key
    Given I am getting existing engage record details
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
    #Get offers by purchase incentive key
    When I am able to get the following API endpoint
      | url                                           | endpoint                                                   |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getOffersByPurchaseIncentiveKey |
    And I send a request to get offers by purchase incentive key
    Then I should see list of offers in get offers response with status code as 200

  @purchaseIncentive  @offer @updateOffer
  Scenario: Verify update offer
    Given I am getting existing engage record details
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
    #Get offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getOffer |
    And I send a request to get offer
    Then I should see offer details in response with status code as 200
     #Update offer
    When I am able to get the following API endpoint
      | url                                           | endpoint                               |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.updateOffer |
    And I send a request to update offer
      | offeringKey         | name              | description                           | termsUrl                          | arvCalculationRuleKey        | tags           | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | offeringKey_<rstr8> | Test Offer<rstr5>_updated | Test offer updated via API automation | https://myengagementurl.com/terms | arvCalculationRuleKey<rstr6>_updated | API_Automation_updated | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see the response with status code as 200 for "Update Offer"
     #Verify updated details in get offer response
    When I am able to get the following API endpoint
      | url                                           | endpoint                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getOffer |
    And I send a request to get offer
    Then I should see updated offer details in response with status code as 200

  @purchaseIncentive  @offer @setOfferDisabled
  Scenario: Verify set offer disabled
    Given I am getting existing engage record details
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
    #Verify offer disabled status as false in get offer response
    When I am able to get the following API endpoint
      | url                                           | endpoint                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getOffer |
    And I send a request to get offer
    Then I should see offer disabled status as "false"
     #Set offer as disabled true
    When I am able to get the following API endpoint
      | url                                           | endpoint                                    |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.setOfferDisabled |
    And I send a request to set offer disabled status as "true"
    Then I should see the response with status code as 200 for "Set Offer as disabled true"
     #Verify offer disabled status as true in get offer response
    When I am able to get the following API endpoint
      | url                                           | endpoint                            |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getOffer |
    And I send a request to get offer
    Then I should see offer disabled status as "true"

  @purchaseIncentive  @offer @createPrizeAllocationOffer
  Scenario: Verify create prize allocation for offer
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
    #Create inventory
    When I am getting the trusted Identifier token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                                   |
      | servicesOfferingOfferingApi | services.purchaseIncentive.createInventory |
    And I send a request to create offering inventory
    Then I should see the inventory created successfully with response status code as 201
    #Create Prize allocation for the offer created above
    When I am getting the trusted Identifier token for the "PurchaseIncentive" sub scope
    And I am able to get the following API endpoint
      | url                                           | endpoint                                         |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPrizeAllocation |
    And I send a request to create prize allocation
      | offeringKey | quantity |
      | offeringKey | 1        |
    Then I should see prize allocation is created successfully with status code as 200

