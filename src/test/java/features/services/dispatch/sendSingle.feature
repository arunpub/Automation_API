Feature: Verify Services.Dispatch.sendSingle

  @Dispatch @sendSingle @sendEmailToSingleRecipient
  Scenario: Verify send Email To Single Recipient

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
      | wardKey | engagementKey | name            | description               | templateRenderType | templateKey | local | propertyTemplateType | templateText                        | Brand  | local1 | propertyTemplateType1 | templateText1                                                    | local2 | propertyTemplateType2 | templateText2                                                                              |
      | wardKey | engagementKey | Template<rstr1> | DecriptionTemplate<rstr1> | Email              | templateKey | en_US | Subject              | Welcome to amazon Email Newsletter! | amazon | en_US  | PlainText             | Welcome testUser to the email newsletter. Your code is PROMO1234 | en_US  | HtmlText              | <html><body>Welcome to testuser2 the email newsletter. Your code is PROMO456</body></html> |

    Then I should see templateCreated successfully

     #Send Email to Single User
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                                |
      | servicesDispatchDispatchApi | services.dispatch.SendSingle.sendEmailToSingleRecipient |

    And I send request for Send Email to Single User with below details
      | emailAddress                 | culture | firstName        | lastName        | userName              | engageUri                     | password  | templateKey | fromAddress             |
      | argon.testing@prizelogic.com | en-US   | FirstName<rstr1> | LastName<rstr1> | bsacamano@example.org | https://engage.prizelogic.com | Password1 | templateKey | no-reply@prizelogic.com |

    Then I should see Send Email to Single User successfully


  @Dispatch @sendSingle @sendCreateUserInvitation
  Scenario: Verify send create user invitation

    Given I am getting the participant token for the "Template" scope
#Create Template Type
    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesTemplateApi | services.template.createTemplateType |

    And i send request for create templateType with below details

      | name                | description                    | mappedPropertyTypes        |
      | Templatetype<rstr3> | TemplatetypeDescription<rstr3> | Subject,PlainText,HtmlText |

    Then I should see templateTypeCreated successfully

   #Create Template
    When I am able to get the following API endpoint
      | url                 | endpoint                         |
      | servicesTemplateApi | services.template.createTemplate |

    And I send request for create template with below details
      | wardKey | engagementKey | name            | description               | templateRenderType | templateKey | local | propertyTemplateType | templateText                        | Brand  | local1 | propertyTemplateType1 | templateText1                                                    | local2 | propertyTemplateType2 | templateText2                                                                              |
      | wardKey | engagementKey | Template<rstr5> | DecriptionTemplate<rstr5> | Email              | templateKey | en_US | Subject              | Welcome to amazon Email Newsletter! | amazon | en_US  | PlainText             | Welcome testUser to the email newsletter. Your code is PROMO1234 | en_US  | HtmlText              | <html><body>Welcome to testuser2 the email newsletter. Your code is PROMO456</body></html> |

    Then I should see templateCreated successfully

     #Send create user invitation
    When I am able to get the following API endpoint and generate token for "Dispatch"
      | url                         | endpoint                                                |
      | servicesDispatchDispatchApi | services.dispatch.SendSingle.sendEmailToSingleRecipient |

    And I send request for Send Email to Single User with below details
      | emailAddress                 | culture | firstName        | lastName        | userName              | engageUri                     | password  | templateKey | fromAddress             |
      | argon.testing@prizelogic.com | en-US   | FirstName<rstr1> | LastName<rstr1> | bsacamano@example.org | https://engage.prizelogic.com | Password1 | templateKey | no-reply@prizelogic.com |

    Then I should see Send Email to Single User successfully