Feature: Verify Services.Dispatch

  @dispatch @subscription @createSubscription
  Scenario: Verify create and get subscription
    Given I am getting existing engage record details
    #Create subscription
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                          |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createSubscription |
    And I send request for create subscription with below details
      | name                    | culture1 | channel1 | channel2 |
      | subscriptionName<rstr4> | en-US    | Email    | SMS      |
    Then I should see subscription created successfully
    #Get subscription
    When I am able to get the following API endpoint
      | url                         | endpoint                                       |
      | servicesDispatchDispatchApi | services.dispatch.subscription.getSubscription |
    And I send request for get subscription
    Then I should see subscription details in response with status code as 200


  @dispatch @subscription @createOptIn
  Scenario: Verify create opt-in
    Given I am getting existing engage record details
   #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create subscription
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                          |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createSubscription |
    And I send request for create subscription with below details
      | name                    | culture1 | channel1 | channel2 |
      | subscriptionName<rstr4> | en-US    | Email    | SMS      |
    Then I should see subscription created successfully
    #Create opt-in
    When I am able to get the following API endpoint
      | url                         | endpoint                                   |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createOptIn |
    And I send request for create opt-in
      | culture | channel1 | channel2 | channel1Pref | channel2Pref |
      | en-US   | Email    | SMS      | 1            | 2            |
    Then I should see Opt-in created successfully with status code 204

  @dispatch @subscription @createAndGetOptIn @RocketMortgage @RMRegisterPhase
  Scenario: Verify create and get opt-in
    Given I am getting existing engage record details
   #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create subscription
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                          |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createSubscription |
    And I send request for create subscription with below details
      | name                    | culture1 | channel1 | channel2 |
      | subscriptionName<rstr4> | en-US    | Email    | SMS      |
    Then I should see subscription created successfully
    #Create opt-in
    When I am able to get the following API endpoint
      | url                         | endpoint                                   |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createOptIn |
    And I send request for create opt-in
      | culture | channel1 | channel2 | channel1Pref | channel2Pref |
      | en-US   | Email    | SMS      | 1            | 2            |
    Then I should see Opt-in created successfully with status code 204
    #Get opt-in
    When I am able to get the following API endpoint
      | url                         | endpoint                                |
      | servicesDispatchDispatchApi | services.dispatch.subscription.getOptIn |
    And I send request for get opt-in
    Then I should see required opt-in details in response

  @dispatch  @subscription @getSubscriptionByFilter
  Scenario: Verify get subscription by filter
    Given I am getting existing engage record details
    #Create subscription
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                          |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createSubscription |
    And I send request for create subscription with below details
      | name                    | culture1 | channel1 | channel2 |
      | subscriptionName<rstr5> | en-US    | Email    | SMS      |
    Then I should see subscription created successfully
    #Get subscriptions by ward
    When I am able to get the following API endpoint
      | url                         | endpoint                                               |
      | servicesDispatchDispatchApi | services.dispatch.subscription.getSubscriptionByFilter |

    And  I send request for get subscription by filter

    Then I should see filtered subscription details with wardkey in response with status code as 200

  @dispatch  @subscription @updateSubscription
  Scenario: Verify update subscription
    Given I am getting existing engage record details
    #Create subscription
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                          |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createSubscription |
    And I send request for create subscription with below details
      | name                    | culture1 | channel1 | channel2 |
      | subscriptionName<rstr6> | en-US    | Email    | SMS      |
    Then I should see subscription created successfully
      #Update subscription

    When I am able to get the following API endpoint
      | url                         | endpoint                                       |
      | servicesDispatchDispatchApi | services.dispatch.subscription.getSubscription |

    And I send a put request with below details for updating subscription
      | name                           | culture1 | channel1 | channel2 |
      | updatedSubscriptionName<rstr6> | en-US    | SMS      | Email    |

    Then I should see subscription details in response with status code as 200

  @dispatch  @subscription @setSubscriptionDisabled
  Scenario: Verify set subscription disabled
    Given I am getting existing engage record details
    #Create subscription
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                          |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createSubscription |
    And I send request for create subscription with below details
      | name                    | culture1 | channel1 | channel2 |
      | subscriptionName<rstr7> | en-US    | Email    | SMS      |
    Then I should see subscription created successfully

      #set subscription disabled

    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                               |
      | servicesDispatchDispatchApi | services.dispatch.subscription.setSubscriptionDisabled |

    And I send a request to disable the subscription

    Then I should see subscription is disabled successfully

    When I am able to get the following API endpoint
      | url                         | endpoint                                       |
      | servicesDispatchDispatchApi | services.dispatch.subscription.getSubscription |

    And I send request for get subscription
    Then I should see subscription is disabled in response

  @dispatch @subscription @optOut
  Scenario: Verify opt-out
    Given I am getting existing engage record details
   #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr7> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/1995  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully
    #Create subscription
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                          |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createSubscription |
    And I send request for create subscription with below details
      | name                    | culture1 | channel1 | channel2 |
      | subscriptionName<rstr4> | en-US    | SMS      | Email    |
    Then I should see subscription created successfully
     #Create opt-in
    When I am able to get the following API endpoint
      | url                         | endpoint                                   |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createOptIn |
    And I send request for create opt-in
      | culture | channel1 | channel2 | channel1Pref | channel2Pref |
      | en-US   | SMS      | Email    | 1            | 2            |
    Then I should see Opt-in created successfully with status code 204

    #opt-Out
    When I am able to get the following API endpoint
      | url                         | endpoint                              |
      | servicesDispatchDispatchApi | services.dispatch.subscription.optOut |

    And I send request for create opt-out with below details
      | wardKey | engagementKey | name        | culture1 | culture2 | channel1 | channel2 |
      | wardKey | engagementKey | Name<rstr4> | en-US    | en-CA    | SMS      | Email    |

    Then I should see Opt-Out created successfully with status code 200

  @dispatch @subscription @BulkOptin
  Scenario: Verify bulk optin for subscription
    Given I am getting existing engage record details
   #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName    | middleName      | lastName    | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr4> | Dr         | MyFirstName1 | SomeMiddleName1 | MyLastName1 | Esq        | 4/1/1995  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName    | middleName      | lastName    | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr5> | Dr         | MyFirstName2 | SomeMiddleName2 | MyLastName2 | Esq        | 4/1/1997  | <rstr5>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully and store participantKey1

    #Create subscription
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                          |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createSubscription |
    And I send request for create subscription with below details
      | name                    | culture1 | channel1 | channel2 |
      | subscriptionName<rstr4> | en-US    | SMS      | Email    |
    Then I should see subscription created successfully

    #Create BulkOptin
    When I am able to get the following API endpoint
      | url                         | endpoint                                      |
      | servicesDispatchDispatchApi | services.dispatch.subscription.creatBulkOptin |

    And I send request for create BulkOpt-in with below details
      | Participant1    | Participant2    | culture | channel1 | channel2 | channel1Pref | channel2Pref |
      | Participant1Key | Participant2Key | en-US   | Email    | SMS      | 1            | 2            |

    Then I should see Opt-in created successfully with status code 200


  @dispatch @subscription @BulkOptOut
  Scenario: Verify bulk optout for subscription
    Given I am getting existing engage record details
   #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |
    And I send request for create Participant with additional header with below details
      | userName   | namePrefix | firstName    | middleName      | lastName    | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rst8> | Dr         | MyFirstName1 | SomeMiddleName1 | MyLastName1 | Esq        | 4/1/1995  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName    | middleName      | lastName    | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr9> | Dr         | MyFirstName2 | SomeMiddleName2 | MyLastName2 | Esq        | 4/1/1998  | <rstr5>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully and store participantKey1

    #Create subscription
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                          |
      | servicesDispatchDispatchApi | services.dispatch.subscription.createSubscription |
    And I send request for create subscription with below details
      | name                    | culture1 | channel1 | channel2 |
      | subscriptionName<rstr4> | en-US    | SMS      | Email    |
    Then I should see subscription created successfully

    #Create BulkOptin
    When I am able to get the following API endpoint
      | url                         | endpoint                                      |
      | servicesDispatchDispatchApi | services.dispatch.subscription.creatBulkOptin |

    And I send request for create BulkOpt-in with below details
      | Participant1    | Participant2    | culture | channel1 | channel2 | channel1Pref | channel2Pref |
      | Participant1Key | Participant2Key | en-US   | Email    | SMS      | 1            | 2            |

    Then I should see Opt-in created successfully with status code 200


    #Create BulkOptOut
    When I am able to get the following API endpoint
      | url                         | endpoint                                       |
      | servicesDispatchDispatchApi | services.dispatch.subscription.creatBulkOptOut |

    And I send request for create BulkOpt-Out with below participants
      | Participant1    | Participant2    |
      | Participant1Key | Participant2Key |

    Then I should see Opt-Out created successfully with status code 200



