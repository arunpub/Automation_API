Feature: Verify Services.FraudAudit

  @fraudAudit  @engagementConfig @createEngagementConfig
  Scenario: Verify create engagement config
    Given I am getting existing engage record details
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
    #Create engagement config
    When I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                   |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createEngagementConfig |
    And I send request for create engagement config with below details
      | ruleKey                  |
      | 615490c0c870fd0128ca8d6d |
    Then I should see engagement config is created successfully with status code as 201
     #Get engagement config
    When I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                         |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.updateAndGetEngagementConfig |
    And I send request for get engagement config
    Then I should see engagement config details with status code as 200

  @fraudAudit @engagementConfig @updateEngagementConfig
  Scenario: Verify update engagement config
    Given I am getting existing engage record details
    #Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
    #Create engagement config
    When I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                   |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createEngagementConfig |
    And I send request for create engagement config with below details
      | ruleKey                  |
      | 615490c0c870fd0128ca8d6d |
    Then I should see engagement config is created successfully with status code as 201
     #Get engagement config
    When I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                         |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.updateAndGetEngagementConfig |
    And I send request for get engagement config
    Then I should see engagement config details with status code as 200
    #Create another action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
    #Update engagement config
    When I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                         |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.updateAndGetEngagementConfig |
    And I send request for update engagement config with below details
      | ruleKey                  |
      | 615490c0c870fd0128ca8d6d |
    Then I should see engagement config is updated successfully with status code as 200
    #Get engagement config
    When I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                         |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.updateAndGetEngagementConfig |
    And I send request for get engagement config
    Then I should see updated engagement config details with status code as 200


  @fraudAudit  @violation @createViolation
  Scenario: Verify create violation
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | MiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create new Action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
    #Create violation
    When I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                            |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createViolation |
    And I send request for create violation
      | actionOccuranceKey | category       | fraudType | appliesTo | correlationType | correlationKey         | participantIPAddress | createdOn                        |
      | Action_<rstr6>     | RepeatOffender | Manual    | testUser  | testType        | correlationKey_<rstr6> | IPAddress_<rstr6>    | 2022-04-24T09:24:59.069166+00:00 |
    Then I should see violation created successfully with status code as 201

  @fraudAudit  @violation @getViolationsByActionKey
  Scenario: Verify get violations by action key
    Given I am getting existing engage record details
    #Create new participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | MiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create new Action
    When I am able to get the following API endpoint and generate token for "Action"
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
    #Create violation
    When I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                            |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createViolation |
    And I send request for create violation
      | actionOccuranceKey | category       | fraudType | appliesTo | correlationType | correlationKey         | participantIPAddress | createdOn                        |
      | Action_<rstr6>     | RepeatOffender | Manual    | testUser  | testType        | correlationKey_<rstr6> | IPAddress_<rstr6>    | 2022-04-24T09:24:59.069166+00:00 |
    Then I should see violation created successfully with status code as 201
    #Get Violations by action key
    When I am able to get the following API endpoint
      | url                             | endpoint                                     |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.getViolationsbyActionKey |
    And I send request for get violation by "actionKey"
    Then I should see a list of violations filtered by "action key" with status code as 200

  @fraudAudit  @violation @getViolationsByParticipantKey
  Scenario: Verify get violations by participant key
    Given I am getting existing engage record details
    #Create new participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | MiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create new Action
    When I am able to get the following API endpoint and generate token for "Action"
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
    #Create violation
    When I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                            |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createViolation |
    And I send request for create violation
      | actionOccuranceKey | category       | fraudType | appliesTo | correlationType | correlationKey         | participantIPAddress | createdOn                        |
      | Action_<rstr6>     | RepeatOffender | Manual    | testUser  | testType        | correlationKey_<rstr6> | IPAddress_<rstr6>    | 2022-04-24T09:24:59.069166+00:00 |
    Then I should see violation created successfully with status code as 201
    #Get Violations by participant key
    When I am able to get the following API endpoint
      | url                             | endpoint                                          |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.getViolationsbyParticipantKey |
    And I send request for get violation by "participantKey"
    Then I should see a list of violations filtered by "participant key" with status code as 200


  @fraudAudit  @violation @getManualFraudCategories
  Scenario: Verify get manual fraud categories
    #Get manual fraud categories
    When I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                     |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.getManualFraudCategories |
    And I send request for get manual fraud categories
    Then I should see a list of manual fraud categories in response with status code as 200

  @fraudAudit @blacklist @createNewBlacklistIPRecord
  Scenario: Verify create new blacklist ip address record
    #create new blacklist ip record
    When I am getting existing engage record details
    And I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                    |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createBlacklistIPRecord |
    And I send request for create blacklist "ip"
      | IPaddress       | reason         | createdBy    |
      | 123.123.123.123 | RepeatOffender | Test_<rstr4> |
    Then I should see new blacklist "ip" record is created successfully with status code as 201

  @fraudAudit @blacklist @disableBlacklistIPRecord
  Scenario: Verify disable blacklist ip address record
    #Create new blacklist ip record
    When I am getting existing engage record details
    And I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                    |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createBlacklistIPRecord |
    And I send request for create blacklist "ip"
      | IPaddress       | reason         | createdBy    |
      |123.123.123.123 | RepeatOffender | Test_<rstr4> |
    Then I should see new blacklist "ip" record is created successfully with status code as 201
    #Disable blacklist ip record
    When I am able to get the following API endpoint
      | url                             | endpoint                                      |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.disablesBlacklistIPRecord |
    And I send request for disable blacklist "ip"
    Then I should see blacklist "ip" is disabled with status code as 200

  @fraudAudit @blacklist @createNewBlacklistAddressRecord
  Scenario: Verify create new blacklist address record
    #create new blacklist address record
    When I am getting existing engage record details
    And I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                         |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createBlacklistAddressRecord |
    And I send request for create blacklist "address"
      | addressLine1               | addressLine2 | city       | state | postalCode | countryCode | reason         | createdBy    |
      | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | AZ    | 85250      | US          | RepeatOffender | Test_<rstr4> |
    Then I should see new blacklist "address" record is created successfully with status code as 201

  @fraudAudit @blacklist @disableBlacklistAddressRecord
  Scenario: Verify disable blacklist address record
    #Create blacklist address record
    When I am getting existing engage record details
    And I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                         |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createBlacklistAddressRecord |
    And I send request for create blacklist "address"
      | addressLine1               | addressLine2 | city       | state | postalCode | countryCode | reason         | createdBy    |
      | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | AZ    | 85250      | US          | RepeatOffender | Test_<rstr4> |
    Then I should see new blacklist "address" record is created successfully with status code as 201
    #Disable blacklist address record
    When I am able to get the following API endpoint
      | url                             | endpoint                                      |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.disablesBlacklistAddressRecord |
    And I send request for disable blacklist address
      | addressLine1               | addressLine2 | city       | state | postalCode | countryCode |
      | 7702 E Doubletree Ranch Rd | Suite 200    | Scottsdale | AZ    | 85250      | US          |
    Then I should see blacklist "address" is disabled with status code as 200


  @fraudAudit @blacklist @createNewBlacklistDomainRecord
  Scenario: Verify create new blacklist Email domain record
    #create new blacklist domain record
    When I am getting existing engage record details
    And I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                         |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createBlacklistDomainRecord |
    And I send request for create blacklist "domain"
      | domain               | reason         | createdBy    |
      | gmail.com | RepeatOffender | Test_<rstr4> |
    Then I should see new blacklist "domain" record is created successfully with status code as 201

  @fraudAudit @blacklist @disableBlacklistDomainRecord
  Scenario: Verify disable blacklist Email domain record
    #create new blacklist domain record
    When I am getting existing engage record details
    And I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                         |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createBlacklistDomainRecord |
    And I send request for create blacklist "domain"
      | domain               | reason         | createdBy    |
      | gmail.com   | RepeatOffender | Test_<rstr4> |
    Then I should see new blacklist "domain" record is created successfully with status code as 201
    #Disable blacklist domain record
    When I am able to get the following API endpoint
      | url                             | endpoint                                      |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.disablesBlacklistDomainRecord |
    And I send request for disable blacklist "domain"
    Then I should see blacklist "domain" is disabled with status code as 200

  @fraudAudit @blacklist @createNewBlacklistPhoneRecord
  Scenario: Verify create new blacklist phone record
    #create new blacklist phone record
    When I am getting existing engage record details
    And I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                         |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createBlacklistPhoneRecord |
    And I send request for create blacklist "phone"
      | phone               | reason         | createdBy    |
      | 5432567854 | RepeatOffender | Test_<rstr4> |
    Then I should see new blacklist "phone" record is created successfully with status code as 201

  @fraudAudit @blacklist @disableBlacklistPhoneRecord
  Scenario: Verify disable blacklist phone record
    #create new blacklist phone record
    When I am getting existing engage record details
    And I am able to get the following API endpoint and generate token for "FraudAudit"
      | url                             | endpoint                                         |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.createBlacklistPhoneRecord |
    And I send request for create blacklist "phone"
      | phone               | reason         | createdBy    |
      | 5467876775 | RepeatOffender | Test_<rstr4> |
    Then I should see new blacklist "phone" record is created successfully with status code as 201
    #Disable blacklist phone record
    When I am able to get the following API endpoint
      | url                             | endpoint                                      |
      | servicesFraudAuditFraudAuditApi | services.fraudAudit.disablesBlacklistPhoneRecord |
    And I send request for disable blacklist "phone"
    Then I should see blacklist "phone" is disabled with status code as 200