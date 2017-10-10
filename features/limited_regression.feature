Feature: Login feature

  @restart
  Scenario: As a valid user I can log into my app
    When The "welcome" screen is present
    And The splash screen is gone
    And I press the larky "Sign in" button
    And I sign in with the test account
    Then Map view is loaded "with" perks count

  Scenario: As a logged in user I can view perks in many locations
    When I touch the "map" "location" filter
    And I select "Another location" from a filter
    And I enter "Ypsi" on the search form on the page
    When I select the first location from google autocomplete
    And Map view is loaded "with" perks count
    Then The map location filter should be set to "Ypsilanti"
    
  Scenario: As a logged in user I can search for an invalid term and clear it
    When I press the larky button with id "map-search-button"
    And I search for "lakjwroei" on the map
    And Map view is loaded "without" perks count
    Then The no search results ul is shown
    When I press the larky button with id "map-search-button"
    And I clear the search on the map
    And Map view is loaded "with" perks count
  
  Scenario: As a logged in user I can redeem a perk
    When I tap the map to clear the keyboard
    And I open a perk from the map view
    And The "perkdetail" screen is present
    Then The "Get It Now" button exists
    When I press the larky "Get It Now" button
    When I press the back button in the app
    Then I should see the correct redemption overlay
    And I should see the correct redemption question
    And I press the back button in the app
  

  Scenario: As a logged in user I can add and remove a membership
    When I choose the "Add Memberships" option from the drawer