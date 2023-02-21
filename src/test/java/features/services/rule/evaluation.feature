Feature: Verify Services.Rule.Evaluation

  @rule  @evaluation @evaluatePurchaseModelAgainstRuleSet
  Scenario: Verify evaluate purchase model against rule set
    Given I am getting existing engage record details
    #Create a purchase model rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "Purchase" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
    #Evaluation purchase model against rule
    When I am able to get the following API endpoint
      | url                 | endpoint                                          |
      | servicesRuleRuleApi | services.rule.evaluatePurchaseModelAgainstRuleSet |
    And I send request for evaluate purchase model against rule set
      | invoiceDate                       | purchaseMode | retailerName | retailerLocation | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | phone      | invoiceItemType | invoiceItemName | invoiceOption | invoiceSKU  | vendorBrand | category     | productName | upc         | flavor     | volume     | size | invoiceCategory     | createdOn                         |
      | 2020-04-11T14:16:05.4506296+00:00 | Default      | TestRetailor | RetailorLocation | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | 5558675309 | Test            | TestInvoice     | Email         | SKU_<rstr6> | TestBrand   | TestCategory | TestProduct | UPC_<rstr5> | testFlavor | testVolume | LG   | TestInvoiceCategory | 2020-04-11T14:16:05.4506296+00:00 |
    Then I should see evaluate purchase model against rule is created successfully with status code as 200

  @rule  @evaluation @evaluatePurchaseModelAgainstRuleJson
  Scenario: Verify evaluate purchase model against rule set
    Given I am getting existing engage record details
      #Create a purchase model rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "Purchase" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
   #Evaluation purchase model against rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                             |
      | servicesRuleRuleApi | services.rule.evaluateSamplePurchase |
    And I send request for evaluate purchase model against rule json
      |offerKey| invoiceDate                       | purchaseMode | retailerName | retailerLocation | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | phone      | invoiceItemType | invoiceItemName | invoiceOption | invoiceSKU  | vendorBrand | category     | productName | upc         | flavor     | volume     | size | invoiceCategory     | createdOn                         | dateClaimed                       | submissionStatus | offerTags |
      |testOfferKey_<rstr6>| 2020-04-10T14:16:05.4506296+00:00 | Default      | TestRetailor | RetailorLocation | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | 5558675309 | Test            | TestInvoice     | Email         | SKU_<rstr6> | TestBrand   | TestCategory | TestProduct | UPC_<rstr5> | testFlavor | testVolume | LG   | TestInvoiceCategory | 2020-04-10T14:16:05.4506296+00:00 | 2020-04-10T14:16:05.4506296+00:00 | Submitted        | TestOffer |
    Then I should see evaluate sample purchase rule is completed successfully with status code as 200


  @rule  @evaluation @evaluateArvCalculationAgainstRuleSet
  Scenario: Verify evaluate ArvCalculation model against rule set
    Given I am getting existing engage record details
    #Create a arv calculation rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "ArvCalculation" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
    #Evaluation of arvCalculation rule
    When I am able to get the following API endpoint
      | url                 | endpoint                                          |
      | servicesRuleRuleApi | services.rule.evaluateArvCalculation |
    And I send request for evaluate arv calculation rule
      | invoiceItemType | invoiceItemName | invoiceOption | invoiceSKU  | vendorBrand | category     | productName | upc         | flavor     | volume     | size | invoiceCategory     |
      | Test            | TestInvoice     | Email         | SKU_<rstr6> | TestBrand   | TestCategory | TestProduct | UPC_<rstr5> | testFlavor | testVolume | LG   | TestInvoiceCategory |
    Then I should see evaluate arv calculation rule is completed successfully with status code as 200

  @rule  @evaluation @evaluateArvCalculationAgainstRuleJson
  Scenario: Verify evaluate ArvCalculation model against rule Json
    Given I am getting existing engage record details
    #Create a arv calculation rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "ArvCalculation" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
    #Evaluation of arvCalculation rule against rule Json
    When I am able to get the following API endpoint
      | url                 | endpoint                                          |
      | servicesRuleRuleApi | services.rule.evaluateSampleArvCalculation |
    And I send request for evaluate arv calculation rule against rule json
      | invoiceItemType | invoiceItemName | invoiceOption | invoiceSKU  | vendorBrand | category     | productName | upc         | flavor     | volume     | size | invoiceCategory     |
      | Test            | TestInvoice     | Email         | SKU_<rstr6> | TestBrand   | TestCategory | TestProduct | UPC_<rstr5> | testFlavor | testVolume | LG   | TestInvoiceCategory |
    Then I should see evaluation of arv calculation rule against json is completed successfully with status code as 200

  @rule  @evaluation @evaluateOfferSelectionRule
  Scenario: Verify evaluate Offer Selection rule
    Given I am getting existing engage record details
    #Create offer selection rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "OfferSelection" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
    #Evaluation of offer selection rule
    When I am able to get the following API endpoint
      | url                 | endpoint                                          |
      | servicesRuleRuleApi | services.rule.evaluateOfferSelectionRule |
    And I send request for evaluate offer selection rule
      |offerKey|offeringKey|offerTag|
      |offerKey_<rstr8>|TestOfferingKey_<rstr6>|API_Automation|
    Then I should see evaluate offer selection rule is completed successfully with status code as 200

  @rule  @evaluation @evaluateSampleOfferSelectionRule
  Scenario: Verify evaluate sample Offer Selection rule
    Given I am getting existing engage record details
    #Create offer selection rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "OfferSelection" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
    #Evaluation of offer selection rule
    When I am able to get the following API endpoint
      | url                 | endpoint                                          |
      | servicesRuleRuleApi | services.rule.evaluateSampleOfferSelection |
    And I send request for evaluate sample offer selection rule
      |offerKey|offeringKey|offerTag|
      |offerKey_<rstr8>|TestOfferingKey_<rstr6>|API_Automation|
    Then I should see evaluate sample offer selection rule is completed successfully with status code as 200

  @rule  @evaluation @evaluateDemographicsRule
  Scenario: Verify evaluate demographics rule
    Given I am getting existing engage record details
    #Create offer selection rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "Demographics" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
    #Evaluation of demographics rule
    When I am able to get the following API endpoint
      | url                 | endpoint                                          |
      | servicesRuleRuleApi | services.rule.evaluateDemographics |
    And I send request for evaluate demographics rule
      |ruleKey|
      |ruleKey|
    Then I should see evaluate demographics rule is completed successfully with status code as 200
