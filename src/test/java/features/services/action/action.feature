Feature: Verify Services.Action

  @action  @createActionToken @RocketMortgage @RMRegisterPhase
  Scenario: Verify create action token
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
      | testAction<rstr4> | testActionDescription | 2021-11-10T13:58:19.164-07:00 | 2021-12-01T02:44:47.337-07:00 | Get a Daily Entry | Sweepstakes | CreateSweepsEntry |
    Then I should see action token created successfully

  #......Verify Create action.......................
  @action @createAction
  Scenario: Verify create action
    Given I am getting the participant token for the "Action" scope
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully

#  ......Verify Get Action..........................
  @action @createandgetAction
  Scenario: Verify create and get action
    Given I am getting the participant token for the "Action" scope
#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully

#Getaction
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |
    And I send get request for get action
    Then I should see newly created action details in response

  @action @updateAction
  Scenario: Verify update action using actionkey

    Given I am getting the participant token for the "Action" scope

  #Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |

    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr2> | ActionDescription<rstr2> | engagementKey | wardkey | tag3<rstr3> | tag4<rstr4> |

    Then I should see action created successfully

            #Update action

    And I send a put request to update created action with below update details
      | name                | description                    | engagementKey | wardkey | 1tag              | 2tag              |
      | UpdateAction<rstr2> | UpdateActionDescription<rstr2> | engagementKey | wardkey | Updatetag3<rstr3> | Updatetag4<rstr4> |

    Then I should see action updated successfully

    #Get action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |

    And I send get request for get action

    Then I should see updated action details in response

  @action @addPrerequisiteToAction
  Scenario: Verify add prerequisite to action using actionkey

    Given I am getting the participant token for the "Action" scope

#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |

    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr3> | ActionDescription<rstr3> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |

    And I send a request to add prerequisite to action with below details
      | actionKey | quantity | period | mustBeSatisfied |
      | actionKey | 2        | Day    | true            |

    Then I should see successfully prerequisite is added to the action

    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |

    And I send get request for get action

    Then I should see prerequisite details under prerequisites section in action response

  @action @removePrerequisiteFromAction
  Scenario: Verify remove a prerequisite from an action using actionkey

    Given I am getting the participant token for the "Action" scope

#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |

    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr4> | ActionDescription<rstr4> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |

    And I send a request to add prerequisite to action with below details
      | actionKey | quantity | period | mustBeSatisfied |
      | actionKey | 4        | Day    | false           |

    Then I should see successfully prerequisite is added to the action

    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |

    And I send get request for get action

    Then I should see prerequisite details under prerequisites section in action response

    When I am able to get the following API endpoint
      | url                     | endpoint                           |
      | servicesActionActionApi | services.action.removePrerequisite |

    And I send a request to remove added prerequisite from action

    Then I should see prerequisite is removed successfully from action

    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |

    And I send get request for get action

    Then I should see prerequisite details removed under prerequisites section in action response

  @action @addLimitToAction
  Scenario: Verify limit to action using actionkey

    Given I am getting the participant token for the "Action" scope

#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |

    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr4> | ActionDescription<rstr4> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |

    And I send request to add limit to the action
      | appliesTo   | demographicKey | required | quantity | period |
      | Participant | null           | true     | 2        | Hour   |

    Then I should see successfully limit is added to the action

    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |

    And I send get request for get action

    Then I should see limits details added to the action

  @action @removeLimitFromAction
  Scenario: Verify remove a limit from action

    Given I am getting the participant token for the "Action" scope

#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |

    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr5> | ActionDescription<rstr4> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |

    And I send request to add limit to the action
      | appliesTo | demographicKey | required | quantity | period |
      | Global    | null           | true     | 5        | minute |

    Then I should see successfully limit is added to the action

    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |

    And I send get request for get action

    Then I should see limits details added to the action

    When I am able to get the following API endpoint
      | url                     | endpoint                    |
      | servicesActionActionApi | services.action.removeLimit |

    And I send a request to remove added limits from action

    Then I should see limit is removed successfully from action

    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |

    And I send get request for get action

    Then I should see limit details removed under limits section in action response


#.........Verify add flow to action using actionkey.......
  @action @Verifyaddflowtoactionusingactionkey
  Scenario: Verify add flow to action using actionkey
    Given I am getting the participant token for the "Action" scope
#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
#addflowtoactionusingactionkey
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | servicesActionActionApi | services.action.addflowtoaction |
    And I send request add flow to action using action key
      | name          | service            | operation            | isSatisfying |
      | Action<rstr1> | Sweepstakes<rstr1> | engagementKey<rstr1> | true         |
    Then I should see flow to action created successfully

#.......Verify add timeframe to action using actionkey......
  @action @Verifyaddtimeframetoactionusingactionkey
  Scenario: Verify add timeframe to action using actionkey
    Given I am getting the participant token for the "Action" scope
#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
#addtimeframetoactionusingactionkey
    When I am able to get the following API endpoint
      | url                     | endpoint                             |
      | servicesActionActionApi | services.action.addtimeframetoaction |
    And I send request add timeframe to action using action key
      | startsOn                      | endsOn                        |
      | 2021-02-17T13:58:19.164-07:00 | 2021-02-23T02:44:47.337-07:00 |
    Then I should see timeframe to timeframe created successfully

#....Verify add constraints to action using actionkey.......
  @action @Verifyaddconstraintstoactionusingactionkey
  Scenario: Verify add constraints to action using actionkey
    Given I am getting the participant token for the "Action" scope
#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
#addconstraintstoactionusingactionkey
    When I am able to get the following API endpoint
      | url                     | endpoint                       |
      | servicesActionActionApi | services.action.addconstraints |
    And I send request add constraints to action using action key
      | characteristic            | value           | listKey | isInclusive | required |
      | DemoCharacteristic<rstr1> | Demoable<rstr1> | null    | false       | false    |
    Then I should see constraints to action created successfully

#.....Verify add limit adjustment action.......
  @action @Verifyaddlimitadjustmentaction
  Scenario: Verify add limit limit adjustment action
    Given I am getting the participant token for the "Action" scope
#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
#addlimitlimitadjustmentaction
    When I am able to get the following API endpoint
      | url                     | endpoint                      |
      | servicesActionActionApi | services.action.addlimitlimit |
    And I send request add limit to action using action key
      | actionKey | appliesTo | demographicKey | multiplier | actionPeriod |
      | actionKey | Global    | null           | 1          | AllTime      |
    Then I should see limit adjustment added  successfully


#.........Verify remove a flow from action.......
  @action @removeaflowfromaction
  Scenario: Verify remove a flow from action
    Given I am getting the participant token for the "Action" scope
#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully

    #addflowtoactionusingactionkey
    When I am able to get the following API endpoint
      | url                     | endpoint                        |
      | servicesActionActionApi | services.action.addflowtoaction |
    And I send request add flow to action using action key
      | name          | service            | operation            | isSatisfying |
      | Action<rstr1> | Sweepstakes<rstr1> | engagementKey<rstr1> | true         |
    Then I should see flow to action created successfully
#Getaction
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |
    And I send a get request for get action to capture flowkey
#removeaflowfromaction
    When I am able to get the following API endpoint
      | url                     | endpoint                           |
      | servicesActionActionApi | services.action.removeflowtoaction |
    And I send request remove flow to action using action key
    Then I should see flow to action removed successfully

# Apply Getaction and Verify Flow is removed
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |
    And I send a get request for get response to capture flowkey
    Then is should see flowkey removed successfully


#....Verify remove a timeframe from action........
  @action @removeatimeframefromaction
  Scenario: Verify remove a timeframe from action
    Given I am getting the participant token for the "Action" scope
#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully

#addtimeframetoactionusingactionkey
    When I am able to get the following API endpoint
      | url                     | endpoint                             |
      | servicesActionActionApi | services.action.addtimeframetoaction |
    And I send request add timeframe to action using action key
      | startsOn                      | endsOn                        |
      | 2021-02-17T13:58:19.164-07:00 | 2021-02-23T02:44:47.337-07:00 |
    Then I should see timeframe to timeframe created successfully

#Getaction
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |
    And I send a get request for get timeframe to capture flowkey
#removeatimeframefromaction
    When I am able to get the following API endpoint
      | url                     | endpoint                                |
      | servicesActionActionApi | services.action.removetimeframetoaction |
    And I send request remove timeframe to action using action key
    Then I should see timeframe to action removed successfully

  # Apply Getaction and Verify Flow is removed
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |
    And I send a get request for get response to capture Timeframe
    Then is should see flowkey removed successfully

#.....Verify remove a constraints from action.................
  @action @removeaconstraintsfromaction
  Scenario: Verify remove a constraints from action
    Given I am getting the participant token for the "Action" scope
#Create action
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with below details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully

#addtimeframetoactionusingactionkey
    When I am able to get the following API endpoint
      | url                     | endpoint                             |
      | servicesActionActionApi | services.action.addtimeframetoaction |
    And I send request add timeframe to action using action key
      | startsOn                      | endsOn                        |
      | 2021-02-17T13:58:19.164-07:00 | 2021-02-23T02:44:47.337-07:00 |
    Then I should see timeframe to timeframe created successfully

#Getaction
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |
    And I send a get request for get timeframe to capture flowkey
#removeaconstraintsfromaction
    When I am able to get the following API endpoint
      | url                     | endpoint                                     |
      | servicesActionActionApi | services.action.removeaconstraintsfromaction |
    And I send request remove constraints to action using action key
    Then I should see constraints to action removed successfully

# Apply Getaction and Verify constraints is removed
    When I am able to get the following API endpoint
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.updateAction |
    And I send a get request for get response to capture constraints
    Then is should see constraints removed successfully

  @action  @getAvailableLimitOccurances @RocketMortgage @RMRegisterPhase
  Scenario: Verify get available limit occurances
    Given I am getting existing engage record details
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                                                |
      | servicesParticipantParticipantApi | services.participant.RegisterParticipantforanengagement |
    And I send request for Register Participant with below details
      | userName    | password    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | culture | emailAddress             | emailType | engagementKey | engagementPassword | isAgeVerified | ageBracket | value                 | wardAttributeKey  | address1                   | address2  | city       | state | postalCode | countryCode | addressType | phonecountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | PASS<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | EN-Us   | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | true          | Over18     | AttributeValue<rstr6> | wardAttributeKey1 | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US           | Home        | 1                | 5558675309  | Home      |
    Then I should see participant Registered successfully
    #Create Action
    When I am able to get the following API endpoint and generate token for "Action"
      | url                     | endpoint                     |
      | servicesActionActionApi | services.action.createAction |
    And I send request for create action with existing engage details
      | name          | description              | engagementKey | wardkey | 1tag        | 2tag        |
      | Action<rstr1> | ActionDescription<rstr1> | engagementKey | wardkey | tag1<rstr1> | tag2<rstr2> |
    Then I should see action created successfully
   # Get Available limit of occurances
    When I am able to get the following API endpoint and generate token for "RMScope"
      | url                               | endpoint                                    |
      | servicesActionActionApi           | services.action.getAvailableLimitOccurances |
    And I send request for get available limit of occurances
    Then I should see the response with status code as 200


    


