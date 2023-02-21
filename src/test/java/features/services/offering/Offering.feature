Feature: Verify Services.Offering

  @Offering @Offerings  @createOffering
#Create Offering
  Scenario: Verify Create Offering
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200

    #teamKey
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
    |teamKey                 |
    |5d41e069c1022fc940c97440|
    Then I should see the response with status code as 204

   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200

    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

#..................Verify create Offering Shipping.........................
  @Offering @Offerings  @createOfferingsShipping
#Create OfferingShipping
  Scenario: Verify Create OfferingShipping
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200

    #teamKey
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      |teamKey                 |
      |5d41e069c1022fc940c97440|
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully
 #Create Shipping carriers
    When I am able to get the following API endpoint
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully
     #Create Shipping method
    When I am able to get the following API endpoint
      | url                         | endpoint                               |
      | servicesOfferingOfferingApi | services.offering.createshippingmethod |
    And I send request for Create Shipping Methods with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierdescription|
    Then I should see Shipping Method created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                  |
      | servicesOfferingOfferingApi | services.offering.createOfferingsShipping |
    And  I send request for Create Offerings Shipping
      | offeringKey | shippingMethodKey | signatureType | declaredValue |
      | offeringKey | shippingMethodKey | Direct        | 1.0           |
    Then I should see the Offerings Shipping created successfully

#.........Verify update Offering Shipping using offeringShippingKey............
  @Offering @Offerings  @updateOfferingShipping
#Create OfferingShipping
  Scenario: Verify update Offering Shipping using offeringShippingKey
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200

    #teamKey
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      |teamKey                 |
      |5d41e069c1022fc940c97440|
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                  |
      | servicesOfferingOfferingApi | services.offering.createOfferingsShipping |
    And  I send request for Create Offerings Shipping
      | offeringKey        | shippingMethodKey        | signatureType | declaredValue |
      | offeringKey<rstr7> | shippingMethodKey<rstr7> | Direct        | 1.0           |
    Then I should see the Offerings Shipping created successfully
#updateOfferingShipping
    When I am able to get the following API endpoint
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.updateOfferingShipping |
    And  I send request for Update Offerings Shipping
      | offeringKey        | shippingMethodKey        | signatureType | declaredValue |
      | offeringKey<rstr7> | shippingMethodKey<rstr7> | Direct        | 1.0           |
    Then I should see the Offerings Shipping Updated successfully

#...........Verify get Offering Shipping by OfferingKey......................

  @Offering @Offerings  @getOfferingShippingbyOfferingKey
  Scenario: Verify get Offering Shipping by OfferingKey
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200

    #teamKey
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      |teamKey                 |
      |5d41e069c1022fc940c97440|
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                  |
      | servicesOfferingOfferingApi | services.offering.createOfferingsShipping |
    And  I send request for Create Offerings Shipping
      | offeringKey | shippingMethodKey | signatureType | declaredValue |
      | offeringKey | shippingMethodKey | Direct        | 1.0           |
    Then I should see the Offerings Shipping created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                      |
      | servicesOfferingOfferingApi | services.offering.getOffering |
    And  I send request for get Offerings
    Then I should see the response with a list of Offerings

    #...................Verify get Offering Shipping using offeringShippingKey...........................
  @Offering @Offerings  @getofferingShippingUsingofferingShippingKey
  Scenario: Verify get Offering Shipping using offeringShippingKey
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200

    #teamKey
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      |teamKey                 |
      |5d41e069c1022fc940c97440|
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                                      |
      | servicesOfferingOfferingApi | services.offering.getofferingShippingUsingofferingShippingKey |
    And  I send request for get Offerings by shippingkey
    Then I should see the response with a list of Offerings by shippingkey


#................Verify delete Offering Shipping using offeringShippingKey Using ShippingMethodkey.......................................
  @Offering @Offerings  @deleteOfferingShippingusingofferingShippingKey
  Scenario: Verify delete Offering Shipping using offeringShippingKey Using ShippingMethodkey

    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200

    #teamKey
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      |teamKey                 |
      |5d41e069c1022fc940c97440|
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                  |
      | servicesOfferingOfferingApi | services.offering.createOfferingsShipping |
    And  I send request for Create Offerings Shipping
      | offeringKey | shippingMethodKey | signatureType | declaredValue |
      | offeringKey | shippingMethodKey | Direct        | 1.0           |
    Then I should see the Offerings Shipping created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.deleteOfferingshipping |
    And  I send request for delete Offerings using ShippingKey
    Then I should see the offering deleted Successfully


#................Verify get Offering Claim Status by POST Method......................
  @Offering @Offerings  @getOfferingClaimStatus
  Scenario: Verify get Offering Claim Status by POST Method
    Given I am getting the participant token for the "Offering" scope

    When I am able to get the following API endpoint
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.getOfferingClaimStatus |
    And  I send request for get Offering Claim Status
      | claimSourceKeys |
      | claimSourceKeys<rstr8> |
    Then I should get Offering Claim Status

  #................Verify update Offering using offeringKey..............
  @Offering @Offerings  @updateOfferingusingofferingKey
#Create Offering
  Scenario: Verify update Offering using offeringKey
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200

    #teamKey
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      |teamKey                 |
      |5d41e069c1022fc940c97440|
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                         |
      | servicesOfferingOfferingApi | services.offering.updateOfferingusingofferingKey |
    And I send request for update Offering using offeringKey with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see Offering is Updated Successfully

 #................Verify get Ward Offering by Filter...................
  @Offering @Offerings  @getWardOfferingbyFilter
  Scenario: Verify get Ward Offering by Filter
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200

    #teamKey
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      |teamKey                 |
      |5d41e069c1022fc940c97440|
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                  |
      | servicesOfferingOfferingApi | services.offering.getWardOfferingbyFilter |
    And  I send request for Get Offering Shipping by wardkey
    Then I should see the response with a list of Offerings Shipping by offering

 #............ Verify get Offering using offeringKey...................
  @Offering @Offerings  @getOfferingusingofferingKey
  Scenario: Verify get Offering using offeringKey
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200

    #teamKey
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      |teamKey                 |
      |5d41e069c1022fc940c97440|
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                      |
      | servicesOfferingOfferingApi | services.offering.getOfferingusingofferingKey |
    And  I send request for Get Offering Shipping by offering
    Then I should see the response with a list of Offerings Shipping by offering

#...............Verify delete Offering using offeringKey................
  @Offering @Offerings  @deleteOfferingusingofferingKey
  Scenario: Verify delete Offering using offeringKey
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
    When I am able to get the following API endpoint
      | url                     | endpoint                                      |
      | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
    And I send request for create access group with below details
      | wardKey | name               | description                                            | engagementKeys |
      | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
    Then I should see the access group created successfully status code as 200

    #teamKey
    When I am able to get the following API endpoint
      | url                     | endpoint                                  |
      | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
    And I send request for add team to the access group
      |teamKey                 |
      |5d41e069c1022fc940c97440|
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                  |
      | servicesOfferingOfferingApi | services.offering.createOfferingsShipping |
    And  I send request for Create Offerings Shipping
      | offeringKey | shippingMethodKey | signatureType | declaredValue |
      | offeringKey | shippingMethodKey | Direct        | 1.0           |
    Then I should see the Offerings Shipping created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.deleteoffering |
    And I send request for delete Offerings using offeringkey
    Then I should see the offering deleted with offeringkey Successfully

     #.....................Verify Create Shipping Carriers....................
  @Offering @Shipping @ShippingCarrier  @CreateShippingCarriers
  Scenario: Verify Create Shipping Carriers
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully

   #.....................Verify get All Shipping Carriers....................
  @Offering @Shipping @ShippingCarrier @getAllShippingCarriers
  Scenario: Verify get All Shipping Carriers
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.getAllShippingCarriers |
    And  I send request for get All Shipping Carriers
    Then I should see the response with a list of all Shippinig Carriers

  #..............Verify update Shipping Carrier using shippingCarrierKey..........
  @Offering @Shipping @ShippingCarrier @updateShippingCarrierusingshippingCarrierKey
  Scenario: Verify update Shipping Carrier using shippingCarrierKey
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                |
      | servicesOfferingOfferingApi | services.offering.updateShippingCarrier |
    And I send request for updateShippingCarrier with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|

    Then I should see ShippingCarrier is Updated Successfully

     #.....................Verify get Shipping Carrier using shippingCarrierKey..................
  @Offering  @Shipping @ShippingCarrier @getShippingCarrierusingshippingCarrierKey
  Scenario: Verify get Shipping Carrier using shippingCarrierKey
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                             |
      | servicesOfferingOfferingApi | services.offering.getShippingCarrier |
    And  I send request for get Shipping Carrier using shippingCarrierKey
    Then I should see the response with a list of all Shippinig Carriers using shippingCarrierKey

    #.............Verify delete Shipping Carrier using shippingCarrierKey........................
  @Offering @Shipping @ShippingCarrier @deleteShippingCarrierusingshippingCarrierKey
  Scenario: Verify delete Shipping Carrier using shippingCarrierKey
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.DeleteShippingCarriers |
    And I send request to deleteShippingCarrier
    Then I should see ShippingCarrier Deleted successfully

   #................................Verify Create Shipping Method........................
  @Offering @Shipping @ShippingMethod @CreateShippingMethod
  Scenario: Verify Create Shipping Method
    Given I am getting existing engage record details

    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                               |
      | servicesOfferingOfferingApi | services.offering.createshippingmethod |
    And I send request for Create Shipping Methods with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierdescription|
    Then I should see Shipping Method created successfully

    #...................Verify get Shipping Method using shippingMethodKey.............
  @Offering @Shipping @ShippingMethod @getShippingMethodusingshippingMethodKey
  Scenario: Verify get Shipping Method
    Given I am getting existing engage record details

    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                               |
      | servicesOfferingOfferingApi | services.offering.createshippingmethod |
    And I send request for Create Shipping Methods with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierdescription|
    Then I should see Shipping Method created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                            |
      | servicesOfferingOfferingApi | services.offering.getshippingmethod |
    And I send request to get Shipping Methods with below details
    Then I should get Shipping Method successfully

  #.............Verify update Shipping Method using shippingMethodKey....................
  @Offering @Shipping @ShippingMethod @updateShippingMethodusingshippingMethodKey
  Scenario: Verify update Shipping Method using shippingMethodKey
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                               |
      | servicesOfferingOfferingApi | services.offering.createshippingmethod |
    And I send request for Create Shipping Methods with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierdescription|
    Then I should see Shipping Method created successfully

    #update Shipping Method
    When I am able to get the following API endpoint
      | url                         | endpoint                               |
      | servicesOfferingOfferingApi | services.offering.updateShippingMethod |
    And I send request to update Shipping Method with below details
      | name                  | description                      |
      | ShippingCarrier<rstr6>| ShippingCarrierDescriptionUpdated|
    Then I should see Shipping Method Updated successfully

  #.................Verify delete Shipping Method using shippingMethodKey.................
  @Offering @Shipping @ShippingMethod @deleteShippingMethodusingshippingMethodKey
  Scenario: Verify delete Shipping Method using shippingMethodKey
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                               |
      | servicesOfferingOfferingApi | services.offering.createshippingmethod |
    And I send request for Create Shipping Methods with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierdescription|
    Then I should see Shipping Method created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                               |
      | servicesOfferingOfferingApi | services.offering.deleteShippingMethod |
    And I send request to deleteShippingMethod
    Then I should see deleteShippingMethod Deleted successfully

    #...................Verify get Shipping Carrier by Name.....................
  @Offering @Shipping @ShippingMethod @VerifygetShippingCarrierbyName
  Scenario: Verify get Shipping Carrier by Name
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully
    When I am able to get the following API endpoint
      | url                         | endpoint                                         |
      | servicesOfferingOfferingApi | services.offering.VerifygetShippingCarrierbyName |
    And I send request to get Shipping Carrier by Name
    Then I should get Shipping Carrier by Name successfully

    #.................Verify get All Shipping Methods by Carrier...............
  @Offering @Shipping @ShippingMethod @getAllShippingMethodsbyCarrier
  Scenario: Verify get All Shipping Methods by Carrier
    Given I am getting existing engage record details

    When I am able to get the following API endpoint and generate token for "Offering"
      | url                         | endpoint                                 |
      | servicesOfferingOfferingApi | services.offering.CreateShippingCarriers |
    And I send request for Create Shipping carrer with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierDesc<rstr6>|
    Then I should see Shipping carrier created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                               |
      | servicesOfferingOfferingApi | services.offering.createshippingmethod |
    And I send request for Create Shipping Methods with below details
      | name                  | description               |
      | ShippingCarrier<rstr6>| ShippingCarrierdescription|
    Then I should see Shipping Method created successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                        |
      | servicesOfferingOfferingApi | services.offering.getAllShippingMethodsbyCarrier|
    And I send request to get All Shipping Methods by Carrier
    Then I should get get All Shipping Methods by Carrier successfully

  #.............Verify create Inventory Edit using offeringKey............
  @Offering @Inventory @createInventoryEditusingofferingKey
  Scenario: Verify create Inventory Edit using offeringKey
     Given I am getting the participant token for the "Engage" scope
  #Create Account
     When I am able to get the following API endpoint
       | url                     | endpoint                              |
       | ServicesEngageEngageApi | services.engage.account.createAccount |
     And I send request for create account in order to create engagement Key "PL01<rnum4>"
       | accountKey     | name                 |
       | TESTACC<rstr6> | Test Account <rstr6> |
     Then I should see account created successfully with status code 204
    #Create Ward
     When I am able to get the following API endpoint
       | url                     | endpoint                        |
       | ServicesEngageEngageApi | services.engage.ward.createWard |
     And I send request for create ward with below details ward in order to create engagement
       | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
       | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
     Then I should see the ward created successfully status code as 204
#    #Create Engagement
     When I am able to get the following API endpoint
       | url                     | endpoint                                     |
       | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
     And I send request for creating an engagement
       | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
       | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
     Then I should see the new engagement must be created successfully with status code as 204
   #Create Access Group
     When I am able to get the following API endpoint
       | url                     | endpoint                                      |
       | ServicesEngageEngageApi | services.engage.accessgroup.createaccessgroup |
     And I send request for create access group with below details
       | wardKey | name               | description                                            | engagementKeys |
       | wardKey | AccessGroup<rstr5> | This is a test access group created via API automation | engagemntKey   |
     Then I should see the access group created successfully status code as 200

    #teamKey
     When I am able to get the following API endpoint
       | url                     | endpoint                                  |
       | ServicesEngageEngageApi | services.engage.accessgroup.addremoveteam |
     And I send request for add team to the access group
       |teamKey                 |
       |5d41e069c1022fc940c97440|
     Then I should see the response with status code as 204
   #Get Access Group details
     When I am able to get the following API endpoint
       | url                     | endpoint                                         |
       | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
     And I send a request to get details of access group with given key
     Then I should see the required access group details with status code as 200
    #Create Offering
     When I am getting the trusted Identifiers token for the "Offering" sub scope
     And I am able to get the following API endpoint
       | url                         | endpoint                         |
       | servicesOfferingOfferingApi | services.offering.createOffering |
     And I send request for create offering with below details
       | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
       | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
     Then I should see the offering created successfully


 # createInventoryEditusingofferingKey
    And I am able to get the following API endpoint
      | url                         | endpoint                                              |
      | servicesOfferingOfferingApi | services.offering.createInventoryEditusingofferingKey |
    And I send request for create Inventory Edit using offering Key with below details
      | adjustment |
      | 500        |
    Then I should see the Inventory Edit created successfully

 #...................... Verify Create Allocate Inventory....................
  @Offering  @Inventory @CreateAllocateInventory
#Create Offering
  Scenario: Verify Create Allocate Inventory
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
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
      | teamKey |
      | 5d41e069c1022fc940c97440 |
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

 #CreateAllocateInventory

  #..............Verify get Inventory Edits using offeringKey with filter...............
  @Offering @Inventory @getInventoryEditsusingofferingKeywithfilter
#Create Offering
  Scenario: Verify get Inventory Edits using offeringKey with filter
    Given I am getting the participant token for the "Engage" scope
  #Create Account
    When I am able to get the following API endpoint
      | url                     | endpoint                              |
      | ServicesEngageEngageApi | services.engage.account.createAccount |
    And I send request for create account in order to create engagement Key "PL01<rnum4>"
      | accountKey     | name                 |
      | TESTACC<rstr6> | Test Account <rstr6> |
    Then I should see account created successfully with status code 204
    #Create Ward
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | ServicesEngageEngageApi | services.engage.ward.createWard |
    And I send request for create ward with below details ward in order to create engagement
      | wardKey    | name                  | description                                    | licenseType | licenseTier | isCdpWardSpecific | isPiiShareable | isPiiMatchingAllowed | isAnonymousMatchingAllowed | isAnalyticsEnabled | isAdminEnabled | isCcpaEnabled | isDemoGalleryEnabled | isCustomerCareEnabled |
      | WKS<rstr5> | Test Ward Service 001 | This is a test ward created via API automation | Standard    | _500k       | false             | false          | true                 | false                      | false              | true           | false         | true                 | true                  |
    Then I should see the ward created successfully status code as 204
#    #Create Engagement
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | ServicesEngageEngageApi | services.engage.engagements.createEngagement |
    And I send request for creating an engagement
      | accountKey | wardKey | engagementKey | name                                       | starts-on            | ends-on              | baseUrl           | features            |
      | accountKey | wardKey | PL01<rnum4>   | Test Engagement Created via API Automation | 2019-01-05T12:13:00Z | 2033-01-05T12:13:00Z | https://myurl.com | Admin","Fulfillment |
    Then I should see the new engagement must be created successfully with status code as 204
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
      | teamKey |
      | 5d41e069c1022fc940c97440 |
    Then I should see the response with status code as 204
   #Get Access Group details
    When I am able to get the following API endpoint
      | url                     | endpoint                                         |
      | ServicesEngageEngageApi | services.engage.accessgroup.getaccessgroupdetail |
    And I send a request to get details of access group with given key
    Then I should see the required access group details with status code as 200
    #Create Offering
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                         |
      | servicesOfferingOfferingApi | services.offering.createOffering |
    And I send request for create offering with below details
      | OfferingKey        | wardKey | engagementKey | name        | description        | notes        | internalSku | vendor     | arvDescription        | MaxArv | IsArvCalculated | IsCombinable | SplitArv | IsActive | deliveryType | IsOnDemand | offeringType        | IsCustomerCare | CreatedOn                 | UpdatedOn                 |
      | QA_Offering<rstr7> | wardKey | engagementKey | test<rstr6> | description<rstr6> | Notes<rstr6> | Sku<rstr6>  | testVendor | ArvDescription<rstr6> | 62.0   | true            | false        | 135.0    | true     | Digital      | true       | OfferingType<rstr6> | false          | 2021-09-14T13:16:39+00:00 | 2021-09-14T13:16:39+00:00 |
    Then I should see the offering created successfully

    #get Inventory Edits using offeringKey with filter
    When I am getting the trusted Identifiers token for the "Offering" sub scope
    And I am able to get the following API endpoint
      | url                         | endpoint                                                      |
      | servicesOfferingOfferingApi | services.offering.getInventoryEditsusingofferingKeywithfilter |
    And I send request to get InventoryEdits
    Then I should see the InventoryEdits  successfully