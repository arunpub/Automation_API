Feature: Verify Services.PurchaseIncentive

  @purchaseIncentive @purchaseIncentive_purchaseIncentive @createPurchaseIncentive
  Scenario: Verify create and get purchase incentive
    Given I am getting existing engage record details
    #Create Purchase Incentive
    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
      | url                                           | endpoint                                           |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPurchaseIncentive |
    And I send request for create purchase incentive with below details
      | limitActionKey | participantClaimLimit | householdClaimLimit | offerClaimMode     | name        | description      | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 4/4/2020 12:00:00.000     | 4/5/2020 12:00:00.000     | 4/8/2020 12:00:00.000   | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Get Purchase Incentive
    When I am able to get the following API endpoint
      | url                                           | endpoint                                        |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getPurchaseIncentive |
    And I send a request for get purchase incentive
    Then I should see the purchase incentive details in the response with status code as 200


  @purchaseIncentive @purchaseIncentive_purchaseIncentive @createSKUEnrichment
  Scenario: Verify create sku enrichment
    Given I am getting existing engage record details
    #Create Purchase Incentive
    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
      | url                                           | endpoint                                           |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPurchaseIncentive |
    And I send request for create purchase incentive with below details
      | limitActionKey | participantClaimLimit | householdClaimLimit | offerClaimMode     | name        | description      | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 4/4/2020 12:00:00.000     | 4/5/2020 12:00:00.000     | 4/8/2020 12:00:00.000   | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Create SKU Enrichment
    When I am able to get the following API endpoint
      | url                                           | endpoint                                       |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createSKUEnrichment |
    And I send a request to create SKU enrichment
      | skuKey     | skuValue |
      | key<rstr8> | <rstr10> |
    Then I should see the response with status code as 200 for "Create SKU enrichment"

  @purchaseIncentive @purchaseIncentive_purchaseIncentive @updatePurchaseIncentive
  Scenario: Verify update purchase incentive
    Given I am getting existing engage record details
    #Create Purchase Incentive
    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
      | url                                           | endpoint                                           |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPurchaseIncentive |
    And I send request for create purchase incentive with below details
      | limitActionKey | participantClaimLimit | householdClaimLimit | offerClaimMode     | name        | description      | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 4/4/2020 12:00:00.000     | 4/5/2020 12:00:00.000     | 4/8/2020 12:00:00.000   | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Get Purchase Incentive
    When I am able to get the following API endpoint
      | url                                           | endpoint                                        |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getPurchaseIncentive |
    And I send a request for get purchase incentive
    Then I should see the purchase incentive details in the response with status code as 200
    #Update purchase incentive
    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
      | url                                           | endpoint                                           |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.updatePurchaseIncentive |
    And I send a request to update purchase incentive
      | participantClaimLimit | householdClaimLimit | offerClaimMode     | name        | description              | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 5                     | 5                   | QualifiedSelection | Test<rstr5>_updated | Test description updated | Purchase incentive updated via API Automation | https://myengagementurl.com/terms | Update a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 4/4/2020 12:00:00.000     | 4/5/2020 12:00:00.000     | 4/8/2020 12:00:00.000   | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see the response with status code as 200 for "Update purchase incentive"
    #Verify updated details in get purchase incentive response
    When I am able to get the following API endpoint
      | url                                           | endpoint                                        |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getPurchaseIncentive |
    And I send a request for get purchase incentive
    Then I should see the updated purchase incentive details in the response with status code as 200

  @purchaseIncentive @purchaseIncentive_purchaseIncentive @setPIDisabled
  Scenario: Verify set PI disabled
    Given I am getting existing engage record details
    #Create Purchase Incentive
    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
      | url                                           | endpoint                                           |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPurchaseIncentive |
    And I send request for create purchase incentive with below details
      | limitActionKey | participantClaimLimit | householdClaimLimit | offerClaimMode     | name        | description      | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 4/4/2020 12:00:00.000     | 4/5/2020 12:00:00.000     | 4/8/2020 12:00:00.000   | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Set PI disabled
    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
      | url                                           | endpoint                                 |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.setPIDisabled |
    And I send a request to set purchase incentive as disabled "true"
    Then I should see the response with status code as 200 for "Set purchase incentive disabled"
    #Verify disabled status in get purchase incentive response
    When I am able to get the following API endpoint
      | url                                           | endpoint                                        |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getPurchaseIncentive |
    And I send a request for get purchase incentive
    Then I should see the disabled status as "true" in response


  @purchaseIncentive @purchaseIncentive_purchaseIncentive @getPurchaseIncentivesWithEngagementKey
  Scenario: Verify get purchase incentives with engagement key
    Given I am getting existing engage record details
    #Create Purchase Incentive
    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
      | url                                           | endpoint                                           |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPurchaseIncentive |
    And I send request for create purchase incentive with below details
      | limitActionKey | participantClaimLimit | householdClaimLimit | offerClaimMode     | name        | description      | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 4/4/2020 12:00:00.000     | 4/5/2020 12:00:00.000     | 4/8/2020 12:00:00.000   | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
    Then I should see purchase incentive created successfully with status code 201
    #Verify get purchase incentives with engagement key
    When I am able to get the following API endpoint
      | url                                           | endpoint                                         |
      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getPurchaseIncentives |
    And I send a request for get purchase incentives with engagement key
    Then I should see the purchase incentives in the response with status code as 200

#  @purchaseIncentive  @getPurchaseIncentivesByFilter
#  Scenario: Verify get purchase incentives by filter
#    Given I am getting existing engage record details
#    #Create Purchase Incentive
#    When I am able to get the following API endpoint and generate token for "PurchaseIncentive"
#      | url                                           | endpoint                                           |
#      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.createPurchaseIncentive |
#    And I send request for create purchase incentive with below details
#      | limitActionKey | participantClaimLimit | householdClaimLimit | offerClaimMode     | name        | description      | details                                       | termsUrl                          | instructions                     | addressLine1               | addressLine2 | city       | state   | postalCode | countryCode | submissionUrl                           | sampleText1 | sampleText2 | startsOn              | endsOn                | submissionStartsOnLocalized | submissionEndsOnLocalized | resubmitStartsOnLocalized | resubmitEndsOnLocalized | purchaseStartsOnLocalized | purchaseEndsOnLocalized |
#      | 2              | 5                     | 5                   | QualifiedSelection | Test<rstr5> | Test description | Purchase incentive created via API Automation | https://myengagementurl.com/terms | Create a test purchase incentive | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | Arizona | 85250      | US          | https://myengagementurl.com/rebates2020 | API         | Automation  | 4/1/2020 12:00:00.000 | 4/1/2023 12:00:00.000 | 4/2/2020 12:00:00.000       | 4/4/2020 12:00:00.000     | 4/5/2020 12:00:00.000     | 4/8/2020 12:00:00.000   | 4/10/2020 12:00:00.000    | 4/15/2020 12:00:00.000  |
#    Then I should see purchase incentive created successfully with status code 201
#    #Get purchase incentives by filter
#    When I am able to get the following API endpoint
#      | url                                           | endpoint                                                |
#      | servicesPurchaseIncentivePurchaseIncentiveApi | services.purchaseIncentive.getPurchaseIncentiveByfilter |
#    And I send a request to get purchase incentives by filter
#    Then I should see the purchase incentives in the response with status code as 200

