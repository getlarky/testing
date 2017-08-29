Feature: Dudcatcher
	
	@restart
	Scenario: On opening the app, I should not see a bggeo license validation failure
		When The bggeo license validation failure does not occur

	Scenario: I should be able to sign up and be redirected to a home base
    	And I press the sign up button
    	And I sign up with a random larky account
    	Then Map view is loaded "with" perks count
    	When I clear the welcome message
    	Then The map location filter should be set to the home base
