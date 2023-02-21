
Feature: Verify Services.Participant
    #......Verify create Participant...........
  @participant @CreateParticipant
  Scenario: Verify create Participant
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | MiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully


#......Verify Register Participant for an engagement.
  @participant @RegisterParticipantforanengagement @RocketMortgage @RMRegisterPhase @RMAssignedCountDownPhase
  Scenario: Verify Register Participant for an engagement
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                                                |
      | servicesParticipantParticipantApi | services.participant.RegisterParticipantforanengagement |
    And I send request for Register Participant with below details
      | userName    | password    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | culture | emailAddress             | emailType | engagementKey | engagementPassword | isAgeVerified | ageBracket | value                 | wardAttributeKey  | address1                   | address2  | city       | state | postalCode | countryCode | addressType | phonecountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | PASS<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | EN-Us   | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | true          | Over18     | AttributeValue<rstr6> | wardAttributeKey1 | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US           | Home        | 1                | 5558675309  | Home      |
    Then I should see participant Registered successfully
    #Verify isRegistered
    When I am able to get the following API endpoint
      | url                               | endpoint                                              |
      | servicesParticipantParticipantApi | services.participant.VerifyisParticipantsisRegistered |
    And  I send request to Verify Participants is Registered
    Then I should see the response Participants is Registered or not

#......Verify BulkUpsertParticipants...........pass
  @participant @BulkUpsertParticipants
  Scenario: Verify Bulk Upsert Participants
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                                    |
      | servicesParticipantParticipantApi | services.participant.BulkUpsertParticipants |
    And I send request for "Create Bulk Upsert Participants" with below details
      | addedBy     | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | password   | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | POST<rstr6> | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see Bulk Upsert Participants created successfully

    #......Verify create Dated Participants ...........pass
  @participant @createDatedParticipants
  Scenario: Verify create Dated Participants
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                                     |
      | servicesParticipantParticipantApi | services.participant.createDatedParticipants |
    And I send request for "Create Dated Participants" with below details
      | userName    | createdOn | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | 4/1/2020  | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see Dated participant created successfully

  #.......Verify Is Phone Valid......................pass
  @participant @VerifyPhoneNumber
  Scenario: Verify Is Phone Valid
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                                |
      | servicesParticipantParticipantApi | services.participant.VerifyPhoneIsValid |
    And I send request for "Verify Phone is Valid" with below details
      | countryCode | phoneNumber |
      | 1           | 5558675309  |
    Then I should see Phone is Verified Sucessfully

# ....... Verify update password.......................End point is not correct
#  @participant @Verifyupdatepassword
#  Scenario: Verify update password
#    Given I am getting existing engage record details
#    When I am able to get the following API endpoint and generate token for "Participant"
#      | url                               | endpoint                               |
#      | servicesParticipantParticipantApi | services.participant.createParticipant |
#    And I send request for "Create Participant" with below details
#      | userName   | namePrefix | firstName  | middleName    |lastName   |nameSuffix | birthdate |emailAddress            |emailType|engagementKey  |engagementPassword|culture|isAgeVerified|ageBracket|address1                  |address2 |city      |state|postalCode|AddresscountryCode|addressType|phonenumbercountryCode|phoneNumber|phoneType|
#      | NAME<rstr6>| Dr         | MyFirstName| SomeMiddleName|MyLastName |Esq        | 4/1/2020  |<rstr6>Email@Hotmail.com|Personal |engagementKey  |MyPassword        |en-US  |true         |Over18    |7702 E Doubletree Ranch Rd|Suite 200|Scottsdale|AZ   |85250     |US                 |Home      |1                     |5558675309 |Home     |
#    Then I should see participant created successfully
#
##    Given I am getting existing engage record details
#    When I am able to get the following API endpoint
#      | url                               | endpoint                                  |
#      | servicesParticipantParticipantApi | services.participant.VerifyUpdatePassword |
#    And I send request for Update Password with below details
#      |oldPassword    |newPassword   |
#      |oldPass<rstr6> |newPass<rstr6>|
#
#    Then I should see Password is Updated Successfully

#........Verify update password with Pin.....................End point is not correct
#  @participant @VerifyupdatepasswordwithPin
#  Scenario: Verify update password with Pin
#    Given I am getting existing engage record details
#    When I am able to get the following API endpoint and generate token for "Participant"
#      | url                               | endpoint                               |
#      | servicesParticipantParticipantApi | services.participant.createParticipant |
#    And I send request for "Create Participant" with below details
#      | userName   | namePrefix | firstName  | middleName    |lastName   |nameSuffix | birthdate |emailAddress            |emailType|engagementKey  |engagementPassword|culture|isAgeVerified|ageBracket|address1                  |address2 |city      |state|postalCode|AddresscountryCode|addressType|phonenumbercountryCode|phoneNumber|phoneType|
#      | NAME<rstr6>| Dr         | MyFirstName| SomeMiddleName|MyLastName |Esq        | 4/1/2020  |<rstr6>Email@Hotmail.com|Personal |engagementKey  |MyPassword        |en-US  |true         |Over18    |7702 E Doubletree Ranch Rd|Suite 200|Scottsdale|AZ   |85250     |US                 |Home      |1                     |5558675309 |Home     |
#    Then I should see participant created successfully
#
##    Given I am getting existing engage record details
#    When I am able to get the following API endpoint
#      | url                               | endpoint                                         |
#      | servicesParticipantParticipantApi | services.participant.VerifyUpdatePasswordwithPin |
#    And I send request for Update Passwordwith Pin with below details
#      |Pin  |newPassword   |
#      |1112 |newPass<rstr6>|
#    Then I should see Password is Updated with Pin Successfully

#......Verify update Personal Info..................................pass
  @participant @VerifyUpdatePersonalInfo
  Scenario: VerifyupdatePersonalInfo

    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

#    Given I am getting the participant token for the "Participant" scope
    When I am able to get the following API endpoint
      | url                               | endpoint                                      |
      | servicesParticipantParticipantApi | services.participant.VerifyUpdatePersonalInfo |
    And I send request for Update PersonalInfo with below details and verify the updated details in response
      | namePrefix | firstName            | middleName     | lastName   | isAgeVerified | ageBracket |
      | Dr         | TestUpdatedFirstName | SomeMiddleName | MyLastName | true          | Over18     |
    Then I should see participant Updated successfully


#......getSlimParticipant...........................................pass
  @participant  @getSlimParticipant @RocketMortgage @RMRegisterPhase
  Scenario: Verify get Slim Participant
    Given I am getting existing engage record details
    And I am getting the trusted Identifier token for the "Participant" sub scope
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
     | servicesParticipantParticipantApi | services.participant.createParticipant |
   And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
     | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
   Then I should see participant created successfully
    When I am able to get the following API endpoint
      | url                               | endpoint                                |
      | servicesParticipantParticipantApi | services.participant.getSlimParticipant |
    And  I send request for get Slim Participant
    Then I should see the response with Slim Participant details

  #......Verify get forgot password Pin..................................pass
  @participant @VerifygetforgotpasswordPin
  Scenario: VerifygetforgotpasswordPin
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

#    Given I am getting the participant token for the "Participant" scope
    When I am able to get the following API endpoint
      | url                               | endpoint                                  |
      | servicesParticipantParticipantApi | services.participant.GetForgotPasswordPin |
    And I send request for get forgot password Pin
    Then I should see Pin in the response with status code as 200

    #......Verify get forgot Engagement password Pin..................................pass
  @participant @VerifygetforgotEngagementpasswordPin
  Scenario: VerifygetforgotEngagementpasswordPin
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

#    Given I am getting the participant token for the "Participant" scope
    When I am able to get the following API endpoint
      | url                               | endpoint                                            |
      | servicesParticipantParticipantApi | services.participant.GetForgotEngagementPasswordPin |
    And I send request for get forgot Engagement password Pin
    Then I should see Engagement Pin in the response with status code as 200

  #......Verify get Slim Participant by Key and Ward Key .................Fail
  @participant  @getSlimParticipantbyKeyandWardKey
  Scenario: Verify get Slim Participant by Key and Ward Key
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                               |
      | servicesParticipantParticipantApi | services.participant.getSlimParticipantByKeyandWardKey |
    And  I send request for get Slim Participant by Key and Ward Key
    Then I should see the response of Slim Participant by Key and Ward Key

#.......Verify get Participant ........................................
  @participant  @getParticipant
  Scenario: Verify get Participant
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                            |
      | servicesParticipantParticipantApi | services.participant.getParticipant |
    And  I send request for get Participant
    Then I should see the list of Participant

#........Verify get Participant Household address.......................
  @participant  @getParticipantHouseholdAddress
  Scenario: Verify get Participant Household Address
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                                |
      | servicesParticipantParticipantApi | services.participant.getSlimParticipanthouseholdaddress |
    And  I send request for get Participant Household Address
    Then I should see the response of Participant Household Address

 #........Verify get Participant Mailing Address .......................
  @participant  @VerifygetParticipantMailingAddress
  Scenario: Verify get Participant Mailing Address
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                          |
      | servicesParticipantParticipantApi | services.participant.getParticipantMailingAddress |
    And  I send request for get Participant Mailing Address
    Then I should see the response of Participant Mailing Address

#........Verify get Participant Most Recent Address .......................
  @participant  @VerifygetParticipantMostRecentAddress
  Scenario: Verify get Participant Most Recent Address

    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                             |
      | servicesParticipantParticipantApi | services.participant.getParticipantMostRecentAddress |
    And  I send request for get Participant Most Recent Address
    Then I should see the response of Participant Most Recent Address

#.......Verify add Participant Address..............................
  @participant @addParticipantAddress
  Scenario: Verify add Participant Address
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                         |
      | servicesParticipantParticipantApi | services.participant.VerifyaddParticipantAddress |
    And I send request to add Participant address with below details
      | address1        | address2        | city     | state | postalCode | countryCode | addressType | addedBy        |
      | address1<rstr6> | address2<rstr6> | Maricopa | AZ    | 85138      | US          | Home        | addedBy<rstr6> |
    Then I should see participant address added successfully

#.......Verify add Participant Email ...............................
  @participant @addParticipantEmail
  Scenario: Verify add Participant Email
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                       |
      | servicesParticipantParticipantApi | services.participant.VerifyaddParticipantEmail |
    And I send request to add Participant email with below details
      | emailAddress        | emailType   |
      | <rstr6>My@email.com | Unspecified |
    Then I should see participant email added successfully

#..........Verify add Engagement ............................ This end point is depricated in postman
#  @participant @addEngagement
  Scenario: Verify add Engagement
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                 |
      | servicesParticipantParticipantApi | services.participant.VerifyaddEngagement |
    And I send request to add Engagement with below details
      | engagementKey | password    |
      | engagementKey | pass<rstr6> |
    Then I should see Engagement added successfully

#..........Verify add Participant Phone......................
  @participant @addParticipantPhone
  Scenario: Verify add Participant Phone
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                       |
      | servicesParticipantParticipantApi | services.participant.VerifyaddParticipantPhone |
    And I send request to add Participant Phone with below details
      | phoneNumber | phoneType   |
      | 3607137493  | Unspecified |
    Then I should see participant Phone added successfully

#......Verify get Participant Household Demographic Key ........................
  @participant  @getParticipantHouseholdDemographicKey
  Scenario: Verify get Participant Household Demographic Key
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                                   |
      | servicesParticipantParticipantApi | services.participant.getParticipantHouseholdDemographicKey |
    And  I send request for get Participant Household Demographic Key
    Then I should see the response with a list of Participant Household Demographic Key

#.......Verify remove Participant Pii...............................................................
  @participant  @removeParticipantPii
  Scenario: Verify remove Participant Pii
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                  |
      | servicesParticipantParticipantApi | services.participant.removeParticipantPii |
    And  I send request for remove Participant Pii
    Then I should see the response with a empty list of ParticipantPii


 #..........Verify add Attribute......................
  @participant @addattribute
  Scenario: Verify add Attribute
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                          |
      | servicesParticipantParticipantApi | services.participant.addattribute |
    And I send request to add Attribute with below details
      | engagementKey | value        | wardAttributeKey        |
      | engagementKey | value<rstr6> | WardAttributeKey<rstr6> |
    Then I should see Attribute added successfully

#..........Verify delete Attribute .....................
  @participant @deleteattribute
  Scenario: Verify delete Attribute
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                          |
      | servicesParticipantParticipantApi | services.participant.addattribute |
    And I send request to add Attribute with below details
      | engagementKey | value        | wardAttributeKey        |
      | PL012345      | value<rstr6> | WardAttributeKey<rstr6> |
    Then I should see Attribute added successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                             |
      | servicesParticipantParticipantApi | services.participant.DeleteAttribute |
    And I send request to Delete Attribute with below details
    Then I should see Attribute Deleted successfully

#.................Verify get Attributes.......................
  @participant @getAttributes
  Scenario: Verify get Attributes
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                           |
      | servicesParticipantParticipantApi | services.participant.getAttributes |
    And  I send request for get Attributes
    Then I should see the response with a list of Attributes

#................Verify get Ward Attributes....................
  @participant @getWardAttributes @RocketMortgage @RMRegisterPhase @RMAssignedCountDownPhase @RMGameDayPhase
  Scenario:Verify get Ward Attributes
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.getWardAttributes |
    And  I send request for get Ward Attributes
    Then I should see the response with a list of Ward Attributes

#..............Verify get Ward Participants.....................
  @participant @getWardParticipants
  Scenario: Verify get Ward Participants
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                |
      | servicesParticipantParticipantApi | services.participant.getWardParticipant |
    And  I send request for get Ward Participants
    Then I should see the response with a list of Ward Participants


#.........Verify Participants is Registered ......................
  @participant @VerifyisParticipantRegistered @RocketMortgage @RMRegisterPhase @RMAssignedCountDownPhase @RMGameDayPhase
  Scenario: Verify "isRegistered" status for participant
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    When I am able to get the following API endpoint
      | url                               | endpoint                                              |
      | servicesParticipantParticipantApi | services.participant.VerifyisParticipantsisRegistered |
    And  I send request to Verify Participants is Registered
    Then I should see the response Participants is Registered or not

#.......Verify get Participant Key using filter ..............
  @participant @VerifygetParticipantKeysusingfilter
  Scenario: Verify get Participant Keys using filter
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for "Create Participant" with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                                |
      | servicesParticipantParticipantApi | services.participant.VerifygetParticipantKeyusingfilter |
    And  I send request to get Participant Key using filter
    Then I should see the response Participants Key using filter

#........Verify get Participants using filter................pass
  @participant @VerifygetParticipantsusingfilter
  Scenario: Verify get Participant using filter
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                              |
      | servicesParticipantParticipantApi | services.participant.VerifygetParticipantsusingfilter |
    And  I send request to get Participants using filter
    Then I should see the response Participants using filter

#......Verify get Participant Address using participantKey......Add more validations
  @participant @VerifygetParticipantAddressusingparticipantKey
  Scenario: Verify get Participant Address using participantKey
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    When I am able to get the following API endpoint
      | url                               | endpoint                                                            |
      | servicesParticipantParticipantApi | services.participant.VerifygetParticipantAddressusingparticipantKey |
    And  I send request to get Participant Address using participantKey
    Then I should see the response Participant Address using participantKey

#.....Verify updateHouseholdDemographicKey for Participant using participantKey.......
  @participant @VerifyupdateHouseholdDemographicKeyforParticipantusingparticipantKey
  Scenario: Verify updateHouseholdDemographicKey for Participant using participantKey

    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

#    Given I am getting the participant token for the "Participant" scope
    When I am able to get the following API endpoint
      | url                               | endpoint                                                                                  |
      | servicesParticipantParticipantApi | services.participant.VerifyupdateHouseholdDemographicKeyforParticipantusingparticipantKey |
    And I send request for Update updateHouseholdDemographicKey with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | isAgeVerified | ageBracket |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | true          | Over18     |
    Then I should see participant Updated successfully


  @participant @get
  Scenario: Verify create Dated Participants
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                                     |
      | servicesParticipantParticipantApi | services.participant.createDatedParticipants |
    And I send request for "Create Dated Participants" with below details
      | userName    | createdOn | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | 4/1/2020  | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see Dated participant created successfully


