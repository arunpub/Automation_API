Feature: Verify Services.Rule.DataSet

  @rule  @engagementDataSet @createAndGetEngagementDataSet
  Scenario: Verify create and get engagement dataset
    Given I am getting existing engage record details
    #Create engagement dataset
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                     | endpoint                     |
      | servicesRuleRuleApi | services.rule.createEngagementDataSet |
    And I send request for create engagement dataSet with below details
    |evaluationDataKey|evaluationDataValue|dataType|
    |key_<rnum4>      |value_<rstr6>      |Default |
    Then I should see engagement dataSet is created successfully with status code as 201
    #Get engagement dataSet
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesRuleRuleApi | services.rule.getEngagementDataSet |
    And I send request for get engagement dataSet
    Then I should see engagement dataset details in response with status code as 200


  @rule  @engagementDataSet @createAndUpdateEngagementDataSet
  Scenario: Verify create and update engagement dataset
    Given I am getting existing engage record details
    #Create engagement dataset
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                     | endpoint                     |
      | servicesRuleRuleApi | services.rule.createEngagementDataSet |
    And I send request for create engagement dataSet with below details
      |evaluationDataKey|evaluationDataValue|dataType|
      |key_<rnum4>      |value_<rstr6>      |Default |
    Then I should see engagement dataSet is created successfully with status code as 201
     #Get engagement dataSet
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesRuleRuleApi | services.rule.getEngagementDataSet |
    And I send request for get engagement dataSet
    Then I should see engagement dataset details in response with status code as 200
    #Update engagement dataSet
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesRuleRuleApi | services.rule.updateEngagementDataSet |
    And I send request to update engagement dataset with below details
      |evaluationDataKey|evaluationDataValue|dataType|
      |key_<rnum4>     |value_<rstr6>      |Default |
    Then I should see engagement dataset is updated successfully with status code as 200
     #Get updated engagement dataSet details
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesRuleRuleApi | services.rule.getEngagementDataSet |
    And I send request for get engagement dataSet
    Then I should engagement dataset updated details in response with status code as 200


  @rule  @engagementDataSet @createAndDeleteEngagementDataSet
  Scenario: Verify create and delete engagement dataset
    Given I am getting existing engage record details
    #Create engagement dataset
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                     | endpoint                     |
      | servicesRuleRuleApi | services.rule.createEngagementDataSet |
    And I send request for create engagement dataSet with below details
      |evaluationDataKey|evaluationDataValue|dataType|
      |key_<rnum4>      |value_<rstr6>      |Default |
    Then I should see engagement dataSet is created successfully with status code as 201
     #Get engagement dataSet
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesRuleRuleApi | services.rule.getEngagementDataSet |
    And I send request for get engagement dataSet
    Then I should see engagement dataset details in response with status code as 200
     #Delete engagement dataset
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesRuleRuleApi | services.rule.deleteEngagementDataSet |
    And I send request for delete engagement dataSet
    Then I should see dataset deleted successfully with status code as 204
    #Verify get engagement shows null response after deletion
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesRuleRuleApi | services.rule.getEngagementDataSet |
    And I send request for get engagement dataSet
    Then I should see response as null response with status code as 200




