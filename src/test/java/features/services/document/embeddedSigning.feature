Feature: Verify Services.document.embeddedSigning

  @document @embededSigning @generateEmbededURL
  Scenario: Verify generate Embeded URL
    Given I am getting existing engage record details
    #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |

    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr5> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    #    Given I am getting existing engage recor

    Given I am getting the participant token for the "Document" scope
    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesDocumentApi | services.document.createFromTemplate |

    And I send request for create envelope from template with below details
      | templateId | filename    | name        | emailAddress                 | participantKey | engagementKey | roleName | createForEmbeddedRequest |
      | templateId | file<rstr2> | Name<rstr4> | argon.testing@prizelogic.com | participantKey | engagementKey | null     | true                     |

    Then I should see envelope created successfully with name "name"

    Given I am getting the participant token for the "Document" scope

    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesDocumentApi | services.document.generateEmbededURL |

    And I send request for generate embeded URL with below details
      | name        | emailAddress | recipientId | signerClientId | returnUrl |
      | Name<rstr4> | emailAddress | null        | null           | returnUrl |

    Then I should see generate embeded URL successfully with URL link


  @document @embeddedSigning @signingReturn
  Scenario: Verify signing return
    Given I am getting existing engage record details
    #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |

    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    #Create envelope from template

    Given I am getting the participant token for the "Document" scope
    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesDocumentApi | services.document.createFromTemplate |

    And I send request for create envelope from template with below details
      | templateId | filename    | name        | emailAddress                 | participantKey | engagementKey | roleName | createForEmbeddedRequest |
      | templateId | file<rstr4> | Name<rstr6> | argon.testing@prizelogic.com | participantKey | engagementKey | null     | true                     |
    Then I should see envelope created successfully with name "name"


    When I am able to get the following API endpoint
      | url                 | endpoint                        |
      | servicesDocumentApi | services.document.signingReturn |

    And I send a signing return get request

    Then I should see signing return successfully


  @document @embeddedSigning @finalSigningReturn
  Scenario: Verify final signing return
    Given I am getting existing engage record details
    #Create Participant
    When I am able to get the following API endpoint and generate token for "Participant"
      | url                               | endpoint                               |
      | servicesParticipantParticipantApi | services.participant.createParticipant |

    And I send request for create Participant with additional header with below details
      | userName    | namePrefix | firstName   | middleName     | lastName   | nameSuffix | birthdate | emailAddress             | emailType | engagementKey | engagementPassword | culture | isAgeVerified | ageBracket | address1                   | address2  | city       | state | postalCode | AddresscountryCode | addressType | phonenumbercountryCode | phoneNumber | phoneType |
      | NAME<rstr6> | Dr         | MyFirstName | SomeMiddleName | MyLastName | Esq        | 4/1/2020  | <rstr6>Email@Hotmail.com | Personal  | engagementKey | MyPassword         | en-US   | true          | Over18     | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | AZ    | 85250      | US                 | Home        | 1                      | 5558675309  | Home      |
    Then I should see participant created successfully

    #Create envelope from template

    Given I am getting the participant token for the "Document" scope
    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesDocumentApi | services.document.createFromTemplate |

    And I send request for create envelope from template with below details
      | templateId | filename    | name        | emailAddress                 | participantKey | engagementKey | roleName | createForEmbeddedRequest |
      | templateId | file<rstr4> | Name<rstr6> | argon.testing@prizelogic.com | participantKey | engagementKey | null     | true                     |
    Then I should see envelope created successfully with name "name"

    #get final signing return
    When I am able to get the following API endpoint
      | url                 | endpoint                             |
      | servicesDocumentApi | services.document.finalsigningReturn |

    And I send a final signing return get request

    Then I should see signing return successfully

