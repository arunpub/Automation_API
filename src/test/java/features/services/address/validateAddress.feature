Feature: Validating the address

  @address
  Scenario: Verify address validation with incorrect address
    Given I am able to get the following API endpoint
      | url                            | endpoint                           |
      | ValidateAddressFunctionBaseUrl | services.address.addressValidation |
    When I send request with below address
      | address1                   | address2  | city       | state   | postalCode | countryCode |
      | 7702 E Doubletree Ranch Rd | Suite 200 | Scottsdale | Arizona | 85250      | US          |
    Then I should see corrected address in response

  @address
  Scenario: Verify address validation with correct address
    Given I am able to get the following API endpoint
      | url                            | endpoint                           |
      | ValidateAddressFunctionBaseUrl | services.address.addressValidation |
    When I send request with below address
      | address1                   | address2  | city       | state   | postalCode | countryCode |
      | 7702 E DOUBLETREE RANCH RD | STE 200   | SCOTTSDALE | AZ      | 85258-2131 | US          |
    Then I should see corrected address in response
