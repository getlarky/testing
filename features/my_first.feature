Feature: Login feature

  Scenario: As a valid user I can log into my app
    When The "welcome" screen is present
    And The splash screen is gone
    And I press the larky "Sign in" button
    And I sign in with the zzz test account
    Then Map view is loaded "with" perks count
    When I press the larky button with id "map-search-button"
    And I search for "lakjwroei" on the map
    And Map view is loaded "without" perks count
    Then The no search results ul is shown
    When I press the larky button with id "map-search-button"
    And I clear the search on the map
    And Map view is loaded "with" perks count
    And I tap the map
  	And I open a perk from the map view
  	And The "perkdetail" screen is present
    Then The "Get It Now" button exists