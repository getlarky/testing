Feature: Limited Regression Test

  @restart
  Scenario: As a valid user I can log into my app
    When The "welcome" screen is present
    And The splash screen is gone
    And I press the larky "Sign in" button
    And I sign in with the test account
    Then Map view is loaded "with" perks count

  Scenario: As a logged in user I can use the help overlay
    When I tap the question mark icon
    Then I should see the help overlay
    When I clear the help overlay

  Scenario: As a logged in user I should be able to view all my perks on a map and expand them
    When I touch the "map" "location" filter
    And I select "Everywhere" from a filter
    Then Map view is loaded "with" perks count
    When I tap a group of perks with a number
    Then There should be that many more icons visible
    
  Scenario: As a logged in user I should be able to adjust my alert preferences
    When I navigate to the "adjust alerts" page from the header
    And The loading screen is gone
    And I tap the first alert category
    And The loading screen is gone
    Then My blacklist preference for the first alert category should toggle
    When I tap the first alert category
    And The loading screen is gone
    Then My blacklist preference for the first alert category should toggle

  Scenario: As a logged in user I can search for an invalid term and clear it
    When I press the larky button with id "map-search-button"
    And I search for "lakjwroei" on the map
    And Map view is loaded "without" perks count
    Then The no search results ul is shown
    When I press the larky button with id "map-search-button"
    And I clear the search on the map
    Then Map view is loaded "with" perks count
    When I tap the map to clear the keyboard

  Scenario: As a logged in user I can redeem a perk
    When I open a perk from the map view
    And The loading screen is gone
    And The "perkdetail" screen is present
    Then The "Get It Now" button exists
    When I press the larky "Get It Now" button
    When I press the back button in the app
    Then I should see the correct redemption overlay
    And I should see the correct redemption question
    And I press the back button in the app

  Scenario: As a logged in user I can view perks in another locations
    When I touch the "map" "location" filter
    And I select "Another location" from a filter
    And I enter "Rale" on the search form on the page
    When I select the first location from google autocomplete
    And Map view is loaded "with" perks count
    Then There should be a "map" filter set to "Raleigh"
    
  Scenario: As a logged in user my filter choices on the map view are persisted on the list view
    When I touch the "map" "category" filter
    And I select "Apparel" from a filter
    And Map view is loaded "without" perks count
    And I press the larky button with id "map-search-button"
    And I search for "hi" on the map
    And Map view is loaded "without" perks count
    And I view the map as a list
    Then There should be a "list" filter set to "Raleigh"
    And There should be a "list" filter set to "Apparel"
    And The "list" search term should be set to "hi"    

  Scenario: The new perks page should be working correctly
    When I navigate to the "new perks" page from the header
    And The new perks page has loaded
    Then The number of new perks should match the count in the header
    When I click a new perk
    And The loading screen is gone
    And The perk detail page has loaded
    Then The new perks count should decrease in the header
    When I choose the "New Perks" option from the drawer
    Then The new perks page has loaded

  Scenario: As a logged in user my home choice is remembered
    When I navigate to the "home" page from the header
    Then The "allperks" screen is present
    And I view the list as a map

  Scenario: As a logged in user, I should receive a local notification
    Then The app has received a local notification

  Scenario: I can log out and sign up as a new user
    And I choose the "Logout" option from the drawer
    And I press the sign up button
    And I sign up with a random larky account
    And I check whether or not my app has an auto-added membership
    Then Map view is loaded "with" perks count
    When I clear the welcome message
    Then The map location filter should be set to the home base

  Scenario: As a logged in user I can add and remove a membership
    When I determine if my app has memberships or not
    And I choose the Add Memberships option from the drawer if it exists
    And I choose to search by name
    And I enter "Alumn" on the search form on the Add Membership page
    And I tap the first membership on the search page
    And The loading screen is gone
    Then I "should" be a member of the first organization
    When I tap the first membership on the search page
    And The loading screen is gone
    Then I "should not" be a member of the first organization
