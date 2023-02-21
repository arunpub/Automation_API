Feature: Verify Services.Survey

  @survey @createandgetsurvey @RocketMortgage @RMRegisterPhase @RMAssignedCountDownPhase @RMGameDayPhase
  Scenario: Verify create and survey
    Given I am getting the participant token for the "Survey" scope
#Create Survey
    When I am able to get the following API endpoint
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send request for create survey with below details
      | engagementKey | name          | description                                    | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 |
      | engagementKey | Survey<rstr2> | This is a SurveyDesc<rstr2> via API automation | wardkey | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            |
    Then I should see Survey created successfully
#Get survey
    When I am able to get the following API endpoint
      | url               | endpoint                  |
      | servicesSurveyApi | services.survey.getSurvey |
    And I send get request for get survey
    Then I should see newly created survey details in response

  @survey @validatesurveywardkey
  Scenario: Validate the Error if Wardkey is not added in the payload
    Given I am getting the participant token for the "Survey" scope
    #Create Survey without wardKey
    When I am able to get the following API endpoint
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send request for create survey without wardkey details
      | engagementKey | name          | description                                    | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 |
      | engagementKey | Survey<rstr4> | This is a SurveyDesc<rstr4> via API automation |         | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            |
    Then I should see error message for missing wardkey


  @survey @updatesurvey
  Scenario: Verify Updation of Existing Survey using SurveyKey
    Given I am getting the participant token for the "Survey" scope
    #Create survey
    When I am able to get the following API endpoint
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send request for create survey with below details
      | engagementKey | name          | description                                                            | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 |
      | engagementKey | Survey<rstr4> | This is a SurveyDesc<rstr2> via API automation to verify update survey | wardkey | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            |
    Then I should see Survey created successfully
    #Update Survey
    When I am able to get the following API endpoint
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.updateSurvey |
    And I send a put request to update survey
      | engagementKey | name                | description                                | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text               | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 |
      | engagementKey | UpdateSurvey<rstr4> | UpdateSurveyDesc<rstr4> via API automation | wardkey | false       | en-US,         | 00:00:50           | 0                   | true                              | What is your favorite School | en-US             | 2                 | true              | MPS          | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            |
    Then I should see updated survey details in response


  @survey @GetSurveyByFilter
  Scenario: Verify 'Survey by Filter' filtering the list of survey records based on EngagementKey

    Given I am getting the participant token for the "Survey" scope
    When I am able to get the following API endpoint
      | url               | endpoint                     |
      | servicesSurveyApi | services.survey.createSurvey |
    And I send request for create two surveys
      | engagementKey | name          | description                                                                   | wardkey | isRepeating | defaultCulture | responseExpiration | questions_sortOrder | questions_supportsMultipleAnswers | questions_text              | questions_culture | answers_sortOrder | answers_isCorrect | answers_text | answers_culture | answers_sortOrder1 | answers_isCorrect1 | answers_text1 | answers_culture1 | answers_sortOrder2 | answers_isCorrect2 | answers_text2 | answers_culture2 |
      | engagementKey | Survey<rstr7> | This is a SurveyDesc<rstr7> via API automation to verify Get Survey By Filter | wardkey | true        | en-US,         | 00:00:50           | 0                   | false                             | What is your favorite color | en-US             | 1                 | true              | Blue         | en-US           | 2                  | true               | Red           | en-US            | 3                  | true               | Orange        | en-US            |
    When I am able to get the following API endpoint
      | url               | endpoint                          |
      | servicesSurveyApi | services.survey.getSurveyByFilter |
    And I send a get survey by filter request with engagement key
    Then I should see created survey's under engagement key in response