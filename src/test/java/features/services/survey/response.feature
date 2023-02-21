Feature: Verify Services.Survey.Response

  @survey @response @createsurveyresponse
  Scenario: Verify create response
    Given I am getting existing engage record details
     #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create Survey with two questions
    When I am able to get the following API endpoint and generate token for "Survey"
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send a request to create survey with two questions and three answers
      | engagementKey | name          | description                                    | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 | questions2_sortOrder | questions2_supportsMultipleAnswers | questions2_text            | questions2_culture | answers2_sortOrder | answers2_isCorrect | answers2_text | answers2_culture | answers2_sortOrder1 | answers2_isCorrect1 | answers2_text1 | answers2_culture1 | answers2_sortOrder2 | answers2_isCorrect2 | answers2_text2 | answers2_culture2 |
      | engagementKey | Survey<rstr2> | This is a SurveyDesc<rstr2> via API automation | wardkey | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            | 1                    | true                               | What is your favorite food | en-US              | 1                  | true               | Pizza         | en-US            | 2                   | true                | Burger         | en-US             | 3                   | true                | Noodles        | en-US             |
    Then I should see Survey created successfully
    #Get survey details and fetch question Keys and answer keys
    When I am able to get the following API endpoint
      | url               | endpoint                  |
      | servicesSurveyApi | services.survey.getSurvey |
    And I send get request for get survey
    Then I fetch the questionKey and answerKeys from get Survey response
    #Create Response for the newly created survey using newly created participant key
    When I am able to get the following API endpoint
      | url               | endpoint                                |
      | servicesSurveyApi | services.survey.response.createResponse |
    And I send a request to create response with below details
      | questionKey_01 | answerKey_01 | answerText_01 | questionKey_02 | answerKey_02 | answerText_02 |
      | questionKey_01 | answerKey_01 | Blue          | questionKey_02 | answerKey_02 | Burger        |
    Then I should see response created successfully


  @survey @response @createandgetsurveyresponse
  Scenario: Verify create and get response
    Given I am getting existing engage record details
     #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create Survey with two questions
    When I am able to get the following API endpoint and generate token for "Survey"
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send a request to create survey with two questions and three answers
      | engagementKey | name          | description                                    | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 | questions2_sortOrder | questions2_supportsMultipleAnswers | questions2_text            | questions2_culture | answers2_sortOrder | answers2_isCorrect | answers2_text | answers2_culture | answers2_sortOrder1 | answers2_isCorrect1 | answers2_text1 | answers2_culture1 | answers2_sortOrder2 | answers2_isCorrect2 | answers2_text2 | answers2_culture2 |
      | engagementKey | Survey<rstr2> | This is a SurveyDesc<rstr2> via API automation | wardkey | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            | 1                    | true                               | What is your favorite food | en-US              | 1                  | true               | Pizza         | en-US            | 2                   | true                | Burger         | en-US             | 3                   | true                | Noodles        | en-US             |
    Then I should see Survey created successfully
    #Get survey details and fetch question Keys and answer keys
    When I am able to get the following API endpoint
      | url               | endpoint                  |
      | servicesSurveyApi | services.survey.getSurvey |
    And I send get request for get survey
    Then I fetch the questionKey and answerKeys from get Survey response
    #Create Response for the newly created survey using newly created participant key
    When I am able to get the following API endpoint
      | url               | endpoint                                |
      | servicesSurveyApi | services.survey.response.createResponse |
    And I send a request to create response with below details
      | questionKey_01 | answerKey_01 | answerText_01 | questionKey_02 | answerKey_02 | answerText_02 |
      | questionKey_01 | answerKey_01 | Blue          | questionKey_02 | answerKey_02 | Burger        |
    Then I should see response created successfully
    #Get Response
    When I am able to get the following API endpoint
      | url               | endpoint                             |
      | servicesSurveyApi | services.survey.response.getResponse |
    And I send a request for get response
    Then I should see the response details in the response of "get response"


  @survey @response @getresponsebyfilter
  Scenario: Verify get response by filter
    Given I am getting existing engage record details
     #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create Survey with two questions
    When I am able to get the following API endpoint and generate token for "Survey"
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send a request to create survey with two questions and three answers
      | engagementKey | name          | description                                    | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 | questions2_sortOrder | questions2_supportsMultipleAnswers | questions2_text            | questions2_culture | answers2_sortOrder | answers2_isCorrect | answers2_text | answers2_culture | answers2_sortOrder1 | answers2_isCorrect1 | answers2_text1 | answers2_culture1 | answers2_sortOrder2 | answers2_isCorrect2 | answers2_text2 | answers2_culture2 |
      | engagementKey | Survey<rstr2> | This is a SurveyDesc<rstr2> via API automation | wardkey | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            | 1                    | true                               | What is your favorite food | en-US              | 1                  | true               | Pizza         | en-US            | 2                   | true                | Burger         | en-US             | 3                   | true                | Noodles        | en-US             |
    Then I should see Survey created successfully
    #Get survey details and fetch question Keys and answer keys
    When I am able to get the following API endpoint
      | url               | endpoint                  |
      | servicesSurveyApi | services.survey.getSurvey |
    And I send get request for get survey
    Then I fetch the questionKey and answerKeys from get Survey response
    #Create Response for the newly created survey using newly created participant key
    When I am able to get the following API endpoint
      | url               | endpoint                                |
      | servicesSurveyApi | services.survey.response.createResponse |
    And I send a request to create response with below details
      | questionKey_01 | answerKey_01 | answerText_01 | questionKey_02 | answerKey_02 | answerText_02 |
      | questionKey_01 | answerKey_01 | Blue          | questionKey_02 | answerKey_02 | Burger        |
    Then I should see response created successfully
    #Get Response by filter
    When I am able to get the following API endpoint
      | url               | endpoint                                     |
      | servicesSurveyApi | services.survey.response.getResponsebyfilter |
    And I send a request for get response by filter
    Then I should see the response details in the response of "get response by filter"


  @survey @response @getresponsebyfilterWithParticipantKeyAndSurveyKey @RocketMortgage @RMRegisterPhase @RMAssignedCountDownPhase  @RMGameDayPhase
  Scenario: Verify get response by filter with participantKey and survey key
    Given I am getting existing engage record details
     #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create Survey with two questions
    When I am able to get the following API endpoint and generate token for "Survey"
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send a request to create survey with two questions and three answers
      | engagementKey | name          | description                                    | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 | questions2_sortOrder | questions2_supportsMultipleAnswers | questions2_text            | questions2_culture | answers2_sortOrder | answers2_isCorrect | answers2_text | answers2_culture | answers2_sortOrder1 | answers2_isCorrect1 | answers2_text1 | answers2_culture1 | answers2_sortOrder2 | answers2_isCorrect2 | answers2_text2 | answers2_culture2 |
      | engagementKey | Survey<rstr2> | This is a SurveyDesc<rstr2> via API automation | wardkey | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            | 1                    | true                               | What is your favorite food | en-US              | 1                  | true               | Pizza         | en-US            | 2                   | true                | Burger         | en-US             | 3                   | true                | Noodles        | en-US             |
    Then I should see Survey created successfully
    #Get survey details and fetch question Keys and answer keys
    When I am able to get the following API endpoint
      | url               | endpoint                  |
      | servicesSurveyApi | services.survey.getSurvey |
    And I send get request for get survey
    Then I fetch the questionKey and answerKeys from get Survey response
    #Create Response for the newly created survey using newly created participant key
    When I am able to get the following API endpoint
      | url               | endpoint                                |
      | servicesSurveyApi | services.survey.response.createResponse |
    And I send a request to create response with below details
      | questionKey_01 | answerKey_01 | answerText_01 | questionKey_02 | answerKey_02 | answerText_02 |
      | questionKey_01 | answerKey_01 | Blue          | questionKey_02 | answerKey_02 | Burger        |
    Then I should see response created successfully
    #Get Response by filter
    When I am able to get the following API endpoint
      | url               | endpoint                                     |
      | servicesSurveyApi | services.survey.response.getResponsebyfilter |
    And I send a request for get response by filter with survey key and participant key
    Then I should see the response details in the response of "get response by filter"

  @survey @response @createengagementresponse @RocketMortgage @RMRegisterPhase
  Scenario: Verify create engagement response
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
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Survey | Respond |
    #Create Survey with two questions
    When I am able to get the following API endpoint and generate token for "Survey"
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send a request to create survey with two questions and three answers with actionKey
      | engagementKey | name          | description                                    | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 | questions2_sortOrder | questions2_supportsMultipleAnswers | questions2_text            | questions2_culture | answers2_sortOrder | answers2_isCorrect | answers2_text | answers2_culture | answers2_sortOrder1 | answers2_isCorrect1 | answers2_text1 | answers2_culture1 | answers2_sortOrder2 | answers2_isCorrect2 | answers2_text2 | answers2_culture2 |
      | engagementKey | Survey<rstr2> | This is a SurveyDesc<rstr2> via API automation | wardkey | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            | 1                    | true                               | What is your favorite food | en-US              | 1                  | true               | Pizza         | en-US            | 2                   | true                | Burger         | en-US             | 3                   | true                | Noodles        | en-US             |
    Then I should see Survey created successfully
    #Get survey details and fetch question Keys and answer keys
    When I am able to get the following API endpoint
      | url               | endpoint                  |
      | servicesSurveyApi | services.survey.getSurvey |
    And I send get request for get survey
    Then I fetch the questionKey and answerKeys from get Survey response
    #Create Engagement Response for the newly created survey using newly created participant key
    When I am able to get the following API endpoint and generate token for "RMScope"
      | url               | endpoint                                          |
      | servicesSurveyApi | services.survey.response.createEngagementResponse |
    And I send a request to create engagement response with below details
      | questionKey_01 | answerKey_01 | answerText_01 | questionKey_02 | answerKey_02 | answerText_02 | participantKey |
      | questionKey_01 | answerKey_01 | Blue          | questionKey_02 | answerKey_02 | Burger        | participantKey |
    Then I should see response created successfully
    #Get Engagement Response
    When I am able to get the following API endpoint
      | url               | endpoint                             |
      | servicesSurveyApi | services.survey.response.getResponsebyfilter |
    And I send a request for get response by filter with survey key and participant key
    Then I should see the response details in the response with engagement Key


  @survey @response @getunansweredquestions
  Scenario: Verify get unanswered questions by participant
    Given I am getting existing engage record details
     #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create Survey with two questions
    When I am able to get the following API endpoint and generate token for "Survey"
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send a request to create survey with two questions and three answers
      | engagementKey | name          | description                                    | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 | questions2_sortOrder | questions2_supportsMultipleAnswers | questions2_text            | questions2_culture | answers2_sortOrder | answers2_isCorrect | answers2_text | answers2_culture | answers2_sortOrder1 | answers2_isCorrect1 | answers2_text1 | answers2_culture1 | answers2_sortOrder2 | answers2_isCorrect2 | answers2_text2 | answers2_culture2 |
      | engagementKey | Survey<rstr2> | This is a SurveyDesc<rstr2> via API automation | wardkey | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            | 1                    | true                               | What is your favorite food | en-US              | 1                  | true               | Pizza         | en-US            | 2                   | true                | Burger         | en-US             | 3                   | true                | Noodles        | en-US             |
    Then I should see Survey created successfully
    #Get survey details and fetch question Keys and answer keys
    When I am able to get the following API endpoint

      | url               | endpoint                  |
      | servicesSurveyApi | services.survey.getSurvey |
    And I send get request for get survey
    Then I fetch the questionKey and answerKeys from get Survey response
    #Create Response for the newly created survey using newly created participant key
    When I am able to get the following API endpoint
      | url               | endpoint                                |
      | servicesSurveyApi | services.survey.response.createResponse |
    And I send a request to create response with only one answer with below details
      | questionKey_01 | answerKey_01 | answerText_01 |
      | questionKey_01 | answerKey_01 | Blue          |
    Then I should see response created successfully
    #Get unanswered questions
    When I am able to get the following API endpoint
      | url               | endpoint                              |
      | servicesSurveyApi | services.survey.getunasweredquestions |
    And I send a request to get unanswered questions
    Then I should see only unanswered question details in response

  @survey @response @createandupdatesurveyresponse
  Scenario: Verify create and update response
    Given I am getting existing engage record details
     #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for Create Participant with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create Survey with two questions
    When I am able to get the following API endpoint and generate token for "Survey"
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send a request to create survey with two questions and three answers
      | engagementKey | name          | description                                    | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 | questions2_sortOrder | questions2_supportsMultipleAnswers | questions2_text            | questions2_culture | answers2_sortOrder | answers2_isCorrect | answers2_text | answers2_culture | answers2_sortOrder1 | answers2_isCorrect1 | answers2_text1 | answers2_culture1 | answers2_sortOrder2 | answers2_isCorrect2 | answers2_text2 | answers2_culture2 |
      | engagementKey | Survey<rstr2> | This is a SurveyDesc<rstr2> via API automation | wardkey | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            | 1                    | true                               | What is your favorite food | en-US              | 1                  | true               | Pizza         | en-US            | 2                   | true                | Burger         | en-US             | 3                   | true                | Noodles        | en-US             |
    Then I should see Survey created successfully
    #Get survey details and fetch question Keys and answer keys
    When I am able to get the following API endpoint
      | url               | endpoint                  |
      | servicesSurveyApi | services.survey.getSurvey |
    And I send get request for get survey
    Then I fetch the questionKey and answerKeys from get Survey response
    #Create Response for the newly created survey using newly created participant key
    When I am able to get the following API endpoint
      | url               | endpoint                                |
      | servicesSurveyApi | services.survey.response.createResponse |
    And I send a request to create response with below details
      | questionKey_01 | answerKey_01 | answerText_01 | questionKey_02 | answerKey_02 | answerText_02 |
      | questionKey_01 | answerKey_01 | Blue          | questionKey_02 | answerKey_02 | Burger        |
    Then I should see response created successfully
    #Get Response
    When I am able to get the following API endpoint
      | url               | endpoint                             |
      | servicesSurveyApi | services.survey.response.getResponse |
    And I send a request for get response
    Then I should see the response details in the response of "get response"
    #Update response
    When I am able to get the following API endpoint
      | url               | endpoint                                |
      | servicesSurveyApi | services.survey.response.updateResponse |
    And I send a put request to update response with below details
      | questionKey_01 | answerKey_01 | answerText_01 | questionKey_02 | answerKey_02 | answerText_02 |
      | questionKey_01 | answerKey_01 | Red           | questionKey_02 | answerKey_02 | Pizza         |
    Then I should see the updated response details in the response






