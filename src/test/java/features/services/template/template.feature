Feature: Verify services.template

  @template @createTemplateType
  Scenario: Verify create templateType
    Given I am getting the participant token for the "Template" scope
    #Create Template Type
    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesTemplateApi | services.template.createTemplateType |

    And i send request for create templateType with below details

      | name                | description                    | mappedPropertyTypes        |
      | Templatetype<rstr1> | TemplatetypeDescription<rstr1> | Subject,PlainText,HtmlText |

    Then I should see templateTypeCreated successfully


  @template @createAndGetTemplate
  Scenario: Verify create and get template

    Given I am getting the participant token for the "Template" scope
#Create Template Type
    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesTemplateApi | services.template.createTemplateType |

    And i send request for create templateType with below details

      | name                | description                    | mappedPropertyTypes        |
      | Templatetype<rstr2> | TemplatetypeDescription<rstr2> | Subject,PlainText,HtmlText |

    Then I should see templateTypeCreated successfully

   #Create Template
    When I am able to get the following API endpoint
      | url                 | endpoint                         |
      | servicesTemplateApi | services.template.createTemplate |

    And I send request for create template with below details
      | wardKey | engagementKey | name            | description               | templateRenderType | templateTypeKey | local | propertyTemplateType | templateText                        | Brand  | local1 | propertyTemplateType1 | templateText1                                                    | local2 | propertyTemplateType2 | templateText2                                                                              |
      | wardKey | engagementKey | Template<rstr1> | DecriptionTemplate<rstr1> | Email              | templateTypeKey | en_US | Subject              | Welcome to amazon Email Newsletter! | amazon | en_US  | PlainText             | Welcome testUser to the email newsletter. Your code is PROMO1234 | en_US  | HtmlText              | <html><body>Welcome to testuser2 the email newsletter. Your code is PROMO456</body></html> |

    Then I should see templateCreated successfully

#Get template
    When I am able to get the following API endpoint
      | url                 | endpoint                      |
      | servicesTemplateApi | services.template.getTemplate |

    And I send get request for get template

    Then I should see newly created template details in response


  @template @updateTemplate
  Scenario: Verify update template

    Given I am getting the participant token for the "Template" scope
#Create Template Type
    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesTemplateApi | services.template.createTemplateType |

    And i send request for create templateType with below details

      | name                | description                    | mappedPropertyTypes        |
      | Templatetype<rstr2> | TemplatetypeDescription<rstr2> | Subject,PlainText,HtmlText |

    Then I should see templateTypeCreated successfully

   #Create Template
    When I am able to get the following API endpoint
      | url                 | endpoint                         |
      | servicesTemplateApi | services.template.createTemplate |

    And I send request for create template with below details
      | wardKey | engagementKey | name            | description               | templateRenderType | templateTypeKey | local | propertyTemplateType | templateText                        | Brand  | local1 | propertyTemplateType1 | templateText1                                                    | local2 | propertyTemplateType2 | templateText2                                                                              |
      | wardKey | engagementKey | Template<rstr1> | DecriptionTemplate<rstr1> | Email              | templateTypeKey | en_US | Subject              | Welcome to amazon Email Newsletter! | amazon | en_US  | PlainText             | Welcome testUser to the email newsletter. Your code is PROMO1234 | en_US  | HtmlText              | <html><body>Welcome to testuser2 the email newsletter. Your code is PROMO456</body></html> |

    Then I should see templateCreated successfully

    And I send a put request to update template
      | engagementKey | name                   | description                      |
      | engagementKey | UpdatedTemplate<rstr1> | UpdatedDecriptionTemplate<rstr1> |

    Then I should see template updated successfully

    When I am able to get the following API endpoint
      | url                 | endpoint                      |
      | servicesTemplateApi | services.template.getTemplate |

    And I send get request for get template

    Then I should see updated template details in response


  @template @getTemplatesByFilter
  Scenario: Verify get templates By Filter

    Given I am getting the participant token for the "Template" scope
   #Create Template Type
    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesTemplateApi | services.template.createTemplateType |

    And i send request for create templateType with below details

      | name                | description                    | mappedPropertyTypes        |
      | Templatetype<rstr2> | TemplatetypeDescription<rstr2> | Subject,PlainText,HtmlText |

    Then I should see templateTypeCreated successfully


   #Create Template
    When I am able to get the following API endpoint
      | url                 | endpoint                         |
      | servicesTemplateApi | services.template.createTemplate |

    And I send request for create template with below details
      | wardKey | engagementKey | name             | description                | templateRenderType | templateTypeKey | local | propertyTemplateType | templateText                        | Brand  | local1 | propertyTemplateType1 | templateText1                                                    | local2 | propertyTemplateType2 | templateText2                                                                              |
      | wardKey | engagementKey | Template1<rstr1> | DecriptionTemplate1<rstr1> | Email              | templateTypeKey | en_US | Subject              | Welcome to amazon Email Newsletter! | amazon | en_US  | PlainText             | Welcome testUser to the email newsletter. Your code is PROMO1234 | en_US  | HtmlText              | <html><body>Welcome to testuser2 the email newsletter. Your code is PROMO456</body></html> |

    Then I should see templateCreated successfully

    And I send request for create another template with below details
      | wardKey | engagementKey | name             | description                | templateRenderType | templateTypeKey | local | propertyTemplateType | templateText                          | Brand    | local1 | propertyTemplateType1 | templateText1                                                    | local2 | propertyTemplateType2 | templateText2                                                                              |
      | wardKey | engagementKey | Template2<rstr1> | DecriptionTemplate2<rstr2> | Email              | templateTypeKey | en_US | Subject              | Welcome to Flipkart Email Newsletter! | Flipkart | en_US  | PlainText             | Welcome testUser to the email newsletter. Your code is PROMO1234 | en_US  | HtmlText              | <html><body>Welcome to testuser2 the email newsletter. Your code is PROMO456</body></html> |

    Then I should see templateCreated successfully

    When I am able to get the following API endpoint
      | url                 | endpoint                              |
      | servicesTemplateApi | services.template.getTemplateByFilter |

    And I send get request to filter out templates using wardkey

    Then I should see associated ward templates details in response


  @template @updateTemplateVersionStatus
  Scenario: Verify update template version status

    Given I am getting the participant token for the "Template" scope
    And I am getting the trusted Identifier token for the "Template" sub scope
#Create Template Type
    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesTemplateApi | services.template.createTemplateType |

    And i send request for create templateType with below details

      | name                | description                    | mappedPropertyTypes        |
      | Templatetype<rstr4> | TemplatetypeDescription<rstr4> | Subject,PlainText,HtmlText |

    Then I should see templateTypeCreated successfully

   #Create Template
    When I am able to get the following API endpoint
      | url                 | endpoint                         |
      | servicesTemplateApi | services.template.createTemplate |

    And I send request for create template with below details
      | wardKey | engagementKey | name            | description               | templateRenderType | templateTypeKey | local | propertyTemplateType | templateText                        | Brand  | local1 | propertyTemplateType1 | templateText1                                                    | local2 | propertyTemplateType2 | templateText2                                                                              |
      | wardKey | engagementKey | Template<rstr6> | DecriptionTemplate<rstr6> | Email              | templateTypeKey | en_US | Subject              | Welcome to amazon Email Newsletter! | amazon | en_US  | PlainText             | Welcome testUser to the email newsletter. Your code is PROMO1234 | en_US  | HtmlText              | <html><body>Welcome to testuser2 the email newsletter. Your code is PROMO456</body></html> |

    Then I should see templateCreated successfully

    When I am able to get the following API endpoint
      | url                 | endpoint                                      |
      | servicesTemplateApi | services.template.updateTemplateStstusVersion |

    And I send a put request to update template version status
      | status   | isActive |
      | Approved | true     |

    Then I should see template updated successfully

    When I am able to get the following API endpoint
      | url                 | endpoint                      |
      | servicesTemplateApi | services.template.getTemplate |

    And I send get request for get template

    Then I should see updated template version status in response

