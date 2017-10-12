require 'calabash-android/calabash_steps'

other_memberships = false

Given /^I determine if my app has memberships or not$/ do
	other_memberships = (evaluate_javascript("SystemWebView", "return (app.config.branding.otherMemberships)")[0] == "yes")
end

Given /^I choose to search by name$/ do
	if other_memberships
		touch("SystemWebView css:'.linkLi' textContent:'Search by name'")
	end
end

Given /^I tap the first membership on the search page$/ do
	sleep(2)
	if other_memberships
		touch("SystemWebView css:'#organizationSearchPage li:first-child'")
	end
end

Given /^I "([^\"]*)" be a member of the first organization$/ do |expectedStatus|
	expectedStatus = (expectedStatus == "should")
	if other_memberships
		membershipStatus = (evaluate_javascript("SystemWebView", "return (app.organizationSearchPageView.viewModel.organizations.data()[0].is_member)")[0] == "true")
		if membershipStatus != expectedStatus
			fail(msg="Your expected status was " + expectedStatus.to_s + ", but your actual status was " + membershipStatus.to_s)
		end
	end
end