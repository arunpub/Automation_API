Feature: Verify services.check

  @check @checkItemInList

  Scenario: Verify check item in list

    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope

    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createList |


    And I send request for create list with below details
      | name           | description         | isHashed | FirstName | Lastname  | Address  |
      | MyList1<rstr1> | description1<rstr1> | true     | Item1MNOP | Item2PQRS | Item3ABC |

    Then I should see list created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                           |
      | servicesListCheckApi | services.listCheck.checkItemInList |

    And I check "FirstName" item is in list
    And I check "Lastname" item is in list
    And I check "Address" item is in list

  @check @checkItemsInList
  Scenario: Verify check items in list

    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope

    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createList |


    And I send request for create list with below details
      | name           | description         | isHashed | FirstName | Lastname  | Address  |
      | MyList1<rstr1> | description1<rstr1> | true     | Item1MNOP | Item2PQRS | Item3ABC |

    Then I should see list created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                            |
      | servicesListCheckApi | services.listCheck.checkItemsInList |

    And I check "FirstName" value is in list
    And I check "Lastname" value is in list
    And I check "Address" value is in list

  @check @checkItemsInLists
  Scenario: Verify check items in lists

    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope

    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createList |


    And I send request for create list with below details
      | name           | description         | isHashed | FirstName | Lastname  | Address  |
      | MyList1<rstr1> | description1<rstr1> | true     | Item1MNOP | Item2PQRS | Item3ABC |

    Then I should see list created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                             |
      | servicesListCheckApi | services.listCheck.checkItemsInLists |

    And I check "FirstName" value is in lists
    And I check "Lastname" value is in lists
    And I check "Address" value is in lists


