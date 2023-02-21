Feature: Verify Services.Sweepstakes

  @sweepstakes  @createAndGetSweepstakesEntry @RocketMortgage @RMRegisterPhase
  Scenario: Verify create and get sweepstake entry
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
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
   #Create action token
    And I am creating action token with below details
      | actionName        | actionDescription     | startsOn                      | endsOn                        | actionFlowName    | service     | operation         |
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Sweepstakes | CreateSweepsEntry |
    #Create Sweepstake
    When I am able to get the following API endpoint and generate token for "Sweepstakes"
      | url                               | endpoint                              |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createSweepstake |
    And I send request for create sweepstake with below details
      | name        | maxEntryMultiplier |
      | test<rstr4> | 10                 |
    Then I should see the sweepstake created successfully
    #Create Sweepstake Entry
    When I am able to get the following API endpoint
      | url                               | endpoint                         |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createEntry |
    And I send request for create sweepstake entry with below details
      | NumberOfEntries |
      | 1               |
    Then I should see sweepstake entry created successfully
    #Get Entry by filter
    When I am able to get the following API endpoint
      | url                               | endpoint                                    |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.getEntrySetKeyByfilter |
    And I send request for get sweepstake entry by filter
    Then I should see the sweepstake entry details in the get entry by filter response
    #Get Entry
    When I am able to get the following API endpoint
      | url                               | endpoint                      |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.getEntry |
    And I send request for get sweepstake entry
    Then I should see the sweepstake entry details in the response

  @sweepstakes  @createAndGetSweepstake
  Scenario: Verify create and get sweepstake
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
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create action token
    And I am creating action token with below details
      | actionName        | actionDescription     | startsOn                      | endsOn                        | actionFlowName    | service     | operation         |
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Sweepstakes | CreateSweepsEntry |
    #Create Sweepstake
    When I am able to get the following API endpoint and generate token for "Sweepstakes"
      | url                               | endpoint                              |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createSweepstake |
    And I send request for create sweepstake with below details
      | name        | maxEntryMultiplier |
      | test<rstr4> | 10                 |
    Then I should see the sweepstake created successfully
    #Get Sweepstake
    When I am able to get the following API endpoint
      | url                               | endpoint                            |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.getSweepstakes |
    And I send request for get sweepstake
    Then I should see the sweepstake details in response


  @sweepstakes  @getSweepstakebyParticipantKey
  Scenario: Verify get sweepstake by participant key
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
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create action token
    And I am creating action token with below details
      | actionName        | actionDescription     | startsOn                      | endsOn                        | actionFlowName    | service     | operation         |
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Sweepstakes | CreateSweepsEntry |
    #Create Sweepstake
    When I am able to get the following API endpoint and generate token for "Sweepstakes"
      | url                               | endpoint                              |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createSweepstake |
    And I send request for create sweepstake with below details
      | name        | maxEntryMultiplier |
      | test<rstr4> | 10                 |
    Then I should see the sweepstake created successfully
     #Create Sweepstake Entry
    When I am able to get the following API endpoint
      | url                               | endpoint                         |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createEntry |
    And I send request for create sweepstake entry with below details
      | NumberOfEntries |
      | 1               |
    Then I should see sweepstake entry created successfully
    #Get Sweepstake by participant key
    When I am able to get the following API endpoint
      | url                               | endpoint                                            |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.getSweepstakesbyparticipantKey |
    And I send request for get sweepstake by participant key
    Then I should see the sweepstake details in response of get sweepstakes by participant key


  @sweepstakes  @getSweepstakebyOfferingKeyFilter
  Scenario: Verify get sweepstake by filter
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
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create action token
    And I am creating action token with below details
      | actionName        | actionDescription     | startsOn                      | endsOn                        | actionFlowName    | service     | operation         |
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Sweepstakes | CreateSweepsEntry |
    #Create Sweepstake
    When I am able to get the following API endpoint and generate token for "Sweepstakes"
      | url                               | endpoint                              |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createSweepstake |
    And I send request for create sweepstake with below details
      | name        | maxEntryMultiplier |
      | test<rstr4> | 10                 |
    Then I should see the sweepstake created successfully
     #Create Sweepstake Entry
    When I am able to get the following API endpoint
      | url                               | endpoint                         |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createEntry |
    And I send request for create sweepstake entry with below details
      | NumberOfEntries |
      | 1               |
    Then I should see sweepstake entry created successfully
    #Get Sweepstake by filter
    When I am able to get the following API endpoint
      | url                               | endpoint                                   |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.getSweepstakeByfilter |
    And I send request for get sweepstake by filter
    Then I should see the sweepstake details in response with filter

  @sweepstakes  @createAndGetSweepstakesEntryByParticipantKeyAndSweepsKey
  Scenario: Verify create and get sweepstake entry by participant key and sweepstake key
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
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create action token
    And I am creating action token with below details
      | actionName        | actionDescription     | startsOn                      | endsOn                        | actionFlowName    | service     | operation         |
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Sweepstakes | CreateSweepsEntry |
    #Create Sweepstake
    When I am able to get the following API endpoint and generate token for "Sweepstakes"
      | url                               | endpoint                              |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createSweepstake |
    And I send request for create sweepstake with below details
      | name        | maxEntryMultiplier |
      | test<rstr4> | 10                 |
    Then I should see the sweepstake created successfully
    #Create Sweepstake Entry
    When I am able to get the following API endpoint
      | url                               | endpoint                         |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createEntry |
    And I send request for create sweepstake entry with below details
      | NumberOfEntries |
      | 1               |
    Then I should see sweepstake entry created successfully
    #Get Entry by participant key and sweepstake key
    When I am able to get the following API endpoint
      | url                               | endpoint                                                                |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.getSweepstakeEntrybyParticipantKeyAndSweepstakeKey |
    And I send request for get sweepstake entry by participant key and sweepstake key
    Then I should see the sweepstake entry details in the get entry response by participant key and sweepstake key

  @sweepstakes  @createAndGetSweepstakesEntryByFilter
  Scenario: Verify create and get sweepstake entry by filter
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
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create action token
    And I am creating action token with below details
      | actionName        | actionDescription     | startsOn                      | endsOn                        | actionFlowName    | service     | operation         |
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Sweepstakes | CreateSweepsEntry |
    #Create Sweepstake
    When I am able to get the following API endpoint and generate token for "Sweepstakes"
      | url                               | endpoint                              |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createSweepstake |
    And I send request for create sweepstake with below details
      | name        | maxEntryMultiplier |
      | test<rstr4> | 10                 |
    Then I should see the sweepstake created successfully
    #Create Sweepstake Entry
    When I am able to get the following API endpoint
      | url                               | endpoint                         |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createEntry |
    And I send request for create sweepstake entry with below details
      | NumberOfEntries |
      | 1               |
    Then I should see sweepstake entry created successfully
    #Get Entry by filter
    When I am able to get the following API endpoint
      | url                               | endpoint                                    |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.getEntrySetKeyByfilter |
    And I send request for get sweepstake entry by filter
    Then I should see the sweepstake entry details in the get entry by filter response

  @sweepstakes  @createAndUpdateSweepstake
  Scenario: Verify create and update sweepstake
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
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create action token
    And I am creating action token with below details
      | actionName        | actionDescription     | startsOn                      | endsOn                        | actionFlowName    | service     | operation         |
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Sweepstakes | CreateSweepsEntry |
    #Create Sweepstake
    When I am able to get the following API endpoint and generate token for "Sweepstakes"
      | url                               | endpoint                              |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createSweepstake |
    And I send request for create sweepstake with below details
      | name        | maxEntryMultiplier |
      | test<rstr4> | 10                 |
    Then I should see the sweepstake created successfully
    #Update Sweepstake
    When I am able to get the following API endpoint
      | url                               | endpoint                              |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.updateSweepstake |
    And I send request for update sweepstake by updating name
      |name                 | offeringKeyOne            |
      |testSweepstake<rstr3>| testOfferingOne<rstr3>    |
    Then I should see the response with status code as 204
    #Get Sweepstake and verify updated details
    When I am able to get the following API endpoint
      | url                               | endpoint                            |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.getSweepstakes |
    And I send request for get sweepstake
    Then I should see the updated sweepstake details in the response


  @sweepstakes  @createAndDeleteSweepstake
  Scenario: Verify create and delete sweepstake
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
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create action token
    And I am creating action token with below details
      | actionName        | actionDescription     | startsOn                      | endsOn                        | actionFlowName    | service     | operation         |
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Sweepstakes | CreateSweepsEntry |
    #Create Sweepstake
    When I am able to get the following API endpoint and generate token for "Sweepstakes"
      | url                               | endpoint                              |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.createSweepstake |
    And I send request for create sweepstake with below details
      | name        | maxEntryMultiplier |
      | test<rstr4> | 10                 |
    Then I should see the sweepstake created successfully
    #Delete Sweepstake
    When I am able to get the following API endpoint
      | url                               | endpoint                              |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.deleteSweepstake |
    And I send request for delete sweepstake
    Then I should see the response with status code as 204
    #Verify the record is deleted
    When I am able to get the following API endpoint
      | url                               | endpoint                            |
      | servicesSweepstakesSweepstakesApi | services.sweepstakes.getSweepstakes |
    And I send request for get sweepstake
    Then I should not see any response as the record has been deleted


