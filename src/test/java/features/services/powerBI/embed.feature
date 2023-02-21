Feature: Verify services.embed

  @embed @getReportPanelRenderingModel
  Scenario: Verify Get report panel rendering model
    Given I am getting the participant token for the "PowerBI" scope
# get Report Panel Rendering Model
    When I am able to get the following API endpoint
      | url                | endpoint                                |
      | servicesPowerBIApi | services.powerBI.getReportpanalRendering |

    And i send request for get report panel rendering model

    Then I should see embed report panel rendering model