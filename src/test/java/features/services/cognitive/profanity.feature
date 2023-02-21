Feature: Verify profanity for the screen text

  @cognitive @profanity
  Scenario: Verify profanity for the unmatched screen text
    Given I am getting the participant token for the "Cognitive" scope
    When I am able to get the following API endpoint
      | url                           | endpoint                     |
      | servicesCognitiveCognitiveApi | services.cognitive.profanity |
    And I send request for profanity check with below text and culture
      | text  | culture |
      | hello | en-US   |
    Then I should see the response with no profanity


  @cognitive @profanity
  Scenario: Verify profanity for the matched screen text
    Given I am getting the participant token for the "Cognitive" scope
    When I am able to get the following API endpoint
      | url                           | endpoint                     |
      | servicesCognitiveCognitiveApi | services.cognitive.profanity |
    And I send request for profanity check with below text and culture
      | text  | culture |
      | damn | en-US   |
    Then I should see the response with profanity


  @cognitive @profanity
  Scenario: Verify error message for the empty screen text
    Given I am getting the participant token for the "Cognitive" scope
    When I am able to get the following API endpoint
      | url                           | endpoint                     |
      | servicesCognitiveCognitiveApi | services.cognitive.profanity |
    And I send request for profanity check with below text and culture
      | text  | culture |
      |       | en-US   |
    And I should see error message "'Text' must not be empty." for empty screen text
