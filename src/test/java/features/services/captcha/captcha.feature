Feature: Verify Services.captcha

    #......Verify create Participant...........
  @captcha @validatecaptcha
  Scenario: Verify Services.captcha
    Given I am getting existing engage record details
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
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Captcha | VerifyCaptcha |
   #Validate captcha
    When I am able to get the following API endpoint
      | url             | endpoint                         |
      | servicescaptcha | services.captcha.validatecaptcha |
    And I send request to validate captcha action key
      | ResponseToken       | EngagementKey | RemoteIp     | ParticipantKey |
      | default-sandbox-true  | EngagementKey | 49.37.154.174 | ParticipantKey |
    Then I should see captcha validated successfully