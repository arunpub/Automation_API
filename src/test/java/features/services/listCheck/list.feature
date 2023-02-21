Feature: Verify Services.List

  @list @createandgetlist
  Scenario: Verify Create list
    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope
    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createList |
    And I send request for create list with below details
      | name           | description         | isHashed | FirstName        | Lastname        | Address          |
      | MyList1<rstr1> | description1<rstr1> | true     | FirstName<rstr1> | LastName<rstr1> | Boston, MA 02130 |
    Then I should see list created successfully
    #Get List
    When I am able to get the following API endpoint
      | url | endpoint |
      | servicesListCheckApi | services.listCheck.getList |
    And I send a get request to fetch list items
    Then I should see list details in response

  @list @getListItems @RocketMortgage @RMRegisterPhase @RMAssignedCountDownPhase @RMGameDayPhase
  Scenario:Verify Get list objects
    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope
    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createList |

    And I send request for create list with below details
      | name           | description         | isHashed | FirstName        | Lastname        | Address          |
      | MyList2<rstr1> | description2<rstr1> | true     | FirstName<rstr2> | LastName<rstr2> | Boston, MA 02134 |

    Then I should see list created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                          |
      | servicesListCheckApi | services.listCheck.getListItems |

    And I send a get request to fetch list items
    Then I should see items associated to list in response


  @list @createWardListAndGetWardList
  Scenario: Verify Create and Get Ward List
    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope
    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createWardList |

    And I send request for create ward list
      | name           | description         | isHashed | keyA        | keyB        | keyC        |
      | MyList2<rstr1> | description2<rstr1> | true     | key1<rstr1> | key2<rstr3> | key3<rstr3> |

    Then I should see list created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.getWardList |


    And I send a get request to fetch ward list

    Then I should see lists associated to ward in response

  @list @AddItemsToList
  Scenario:Verify add items to list
    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope

    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createList |

    And I send request for create list with below details
      | name              | description         | isHashed | FirstName | Lastname | Address          |
      | AddMyList4<rstr1> | description4<rstr1> | true     | Item1     | Item2    | Boston, MA 02167 |

    Then I should see list created successfully

    And I send a put request to add below list items
      | primeryMail            | seconderyMail           | region | timeZone |
      | testEngage@yopmail.com | test2Engage@yopmail.com | India  | IST      |

    Then I should see items added successfully to list

    When I am able to get the following API endpoint
      | url                  | endpoint                          |
      | servicesListCheckApi | services.listCheck.getListObjects |

    And I send a get request to fetch list items

    Then I should see "primeryMail" "seconderyMail" "region" and "timeZone" items are added to list


  @list @removeItemsFromList
  Scenario:Verify remove items from list
    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope

    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createList |

    And I send request for create list with below details
      | name           | description         | isHashed | FirstName | Lastname | Address          |
      | MyList3<rstr1> | description3<rstr1> | true     | Item1     | Item2    | Boston, MA 02167 |

    Then I should see list created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                          |
      | servicesListCheckApi | services.listCheck.getListObjects |

    And I send a get request to fetch list items and collecting respective itemKeys

    When I am able to get the following API endpoint
      | url                  | endpoint                               |
      | servicesListCheckApi | services.listCheck.removeItemsFromList |

    And  I send a request for removing "Item1" and "Boston, MA 02167" items from list

    Then I should see items deleted successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                          |
      | servicesListCheckApi | services.listCheck.getListObjects |

    And I send a get request to fetch list items

    Then I should see "Item1" and "Boston, MA 02167" items are removed from list

  @list @disableList
  Scenario: Verify disable list
    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope

    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createList |

    And I send request for create list with below details
      | name           | description         | isHashed | FirstName         | Lastname          | Address          |
      | MyList4<rstr1> | description4<rstr1> | true     | FirstName2<rstr1> | FirstName2<rstr1> | Boston, MA 02130 |

    Then I should see list created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                       |
      | servicesListCheckApi | services.listCheck.disableList |

    And I send request for disabling the list

    Then I should see list deleted successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                   |
      | servicesListCheckApi | services.listCheck.getList |

    And I send a get request to fetch list items

    Then I should see list is disabled


  @list @updateList
  Scenario: Verify update list
    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope

    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createList |
    And I send request for create list with below details
      | name           | description         | isHashed | FirstName         | Lastname         | Address          |
      | MyList4<rstr1> | description4<rstr1> | true     | FirstName2<rstr1> | Lastname2<rstr1> | Boston, MA 02130 |
    Then I should see list created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.updateList |

    And I send request to update the list with following items
      | FirstName        | Lastname        | Address        |
      | UpdatedFirstName | UpdatedLastName | chicago, NA 58 |

    Then I should see list updated successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                          |
      | servicesListCheckApi | services.listCheck.getListObjects |

    And I send a get request to fetch list items

    Then I should see "UpdatedFirstName" ,"UpdatedLastName" and "chicago, NA 58" items are updated in list

  @list @getPagedListItems
  Scenario: Verify get paged list items
    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope

    When I am able to get the following API endpoint
      | url                  | endpoint                      |
      | servicesListCheckApi | services.listCheck.createList |
    And I send request for create list with below details
      | name           | description         | isHashed | FirstName | Lastname  | Address   |
      | MyList5<rstr1> | description5<rstr1> | true     | Item1Abcd | Item2Pqrs | Item3Mnop |
    Then I should see list created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                             |
      | servicesListCheckApi | services.listCheck.getPagedListItems |

    And I send a get request to fetch page "2" list items

    Then I should see 2 items "Item1Abcd" and "Item2Pqrs" retrieved in list

    When I am able to get the following API endpoint
      | url                  | endpoint                             |
      | servicesListCheckApi | services.listCheck.getPagedListItems |

    And I send a get request to fetch page "3" list items

    Then I should see 3 items "Item1Abcd", "Item2Pqrs" and "Item3Mnop" retrieved in list


  @list @createListFileUpload
  Scenario: Verify Create list file upload

    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope

    And I send a request for create list with file "listItmes.csv" uploaded
      | name           | description         | isHashed |
      | MyList2<rstr1> | description2<rstr1> | false    |

    Then I should see list with file uploaded created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                          |
      | servicesListCheckApi | services.listCheck.getListObjects |

    And I send a get request to fetch list items

    Then I should see items uploaded to list in response


  @list @createWardListFileUpload
  Scenario: Verify Create ward list file upload

    Given I am getting the participant token for the "ListCheck" scope
    And I am getting the trusted Identifier token for the "ListCheck" sub scope

    And I send a request for create list by ward file "listItmes.csv" uploaded
      | name           | description         | isHashed |
      | MyList2<rstr1> | description2<rstr1> | false    |

    Then I should see list with file uploaded created successfully

    When I am able to get the following API endpoint
      | url                  | endpoint                          |
      | servicesListCheckApi | services.listCheck.getListObjects |

    And I send a get request to fetch list items

    Then I should see items uploaded to list in response
















