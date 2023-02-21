Feature: Verify Services.Dispatch

  @document @envelope @createFromTemplate
  Scenario: Verify create from template
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
      | url                         | endpoint                             |
      | servicesDocumentApi         | services.document.createFromTemplate   |

    And I send request for create envelope from template with below details
      | templateId | filename     | name           | emailAddress                      | participantKey|engagementKey|roleName|createForEmbeddedRequest|
      | templateId | file<rstr2>  | Name<rstr2>    | argon.testing@prizelogic.com      | participantKey|engagementKey|null    | true                   |
    Then I should see envelope created successfully with name "name"


