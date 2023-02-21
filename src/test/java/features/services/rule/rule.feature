Feature: Verify Services.Rule

  @rule  @rule_rule @createAndGetRule
  Scenario: Verify create and get rule
    Given I am getting existing engage record details
    #Create a purchase model rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "Purchase" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
    #Get rule
    When I am able to get the following API endpoint
      | url                 | endpoint              |
      | servicesRuleRuleApi | services.rule.getRule |
    And I send request for get rule by ruleKey
    Then I should see the rule details in response with status code as 200


  @rule  @rule_rule @createAndUpdateRule
  Scenario: Verify create and update rule
    Given I am getting existing engage record details
    #Create a purchase model rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "Purchase" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
    #Get rule
    When I am able to get the following API endpoint
      | url                 | endpoint              |
      | servicesRuleRuleApi | services.rule.getRule |
    And I send request for get rule by ruleKey
    Then I should see the rule details in response with status code as 200
    #Update rule
    When I am able to get the following API endpoint
      | url                 | endpoint              |
      | servicesRuleRuleApi | services.rule.updateRule |
    Then I send request to update the rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Other    |
    Then I should see the rule is updated successfully with status code as 200
    #Get rule
    When I am able to get the following API endpoint
      | url                 | endpoint              |
      | servicesRuleRuleApi | services.rule.getRule |
    And I send request for get rule by ruleKey
    Then I should see the rule details in response with status code as 200


  @rule  @rule_rule @createAndDeleteRule
  Scenario: Verify create and delete rule
    Given I am getting existing engage record details
    #Create a purchase model rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "Purchase" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
    #Get rule
    When I am able to get the following API endpoint
      | url                 | endpoint              |
      | servicesRuleRuleApi | services.rule.getRule |
    And I send request for get rule by ruleKey
    Then I should see the rule details in response with status code as 200
    #Delete rule
    When I am able to get the following API endpoint
      | url                 | endpoint              |
      | servicesRuleRuleApi | services.rule.deleteRule |
    And I send request to delete the rule
    Then I should see the rule is deleted successfully with status code as 204

  @rule  @rule_rule @getListOfEvaluationSKUs
  Scenario: Verify get list of evaluation SKUs
    Given I am getting existing engage record details
    #Create a purchase model rule
    When I am able to get the following API endpoint and generate token for "Rule"
      | url                 | endpoint                 |
      | servicesRuleRuleApi | services.rule.createRule |
    And I send request for create a "Purchase" rule
      | typedEvaluationDataKey | typedEvaluationDataValue | dataType |
      | key_<rnum4>            | value_<rstr6>            | Default  |
    Then I should see a rule created successfully with status code as 201
    #Get list of evaluation SKUs
    When I am able to get the following API endpoint
      | url                 | endpoint              |
      | servicesRuleRuleApi | services.rule.getListOfSKUs |
    And I send request for get list of evaluation SKUs
    Then I should see list in response with status code as 200






