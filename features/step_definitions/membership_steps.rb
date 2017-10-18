require 'calabash-android/calabash_steps'

Given /^I determine if my app has memberships or not$/ do
	other_memberships = (evaluate_javascript("SystemWebView", "return (app.config.branding.otherMemberships)")[0] == "yes")
	if !other_memberships
		print "This app doesn't have other memberships. Skipping membership steps."
	end
	pending unless other_memberships
end

Given /^I choose to search by name$/ do
	touch("SystemWebView css:'.linkLi' textContent:'Search by name'")
end

Given /^I tap the first membership on the search page$/ do
	sleep(2)
	touch("SystemWebView css:'#organizationSearchPage li:first-child'")
end

Given /^I "([^\"]*)" be a member of the first organization$/ do |expectedStatus|
	expectedStatus = (expectedStatus == "should")
	membershipStatus = (evaluate_javascript("SystemWebView", "return (app.organizationSearchPageView.viewModel.organizations.data()[0].is_member)")[0] == "true")
	if membershipStatus != expectedStatus
		fail(msg="Your expected status was " + expectedStatus.to_s + ", but your actual status was " + membershipStatus.to_s)
	end
end

Given /^I choose the Add Memberships option from the drawer if it exists$/ do
	touch("SystemWebview css:'[href=\"#my-drawer\"]'")
	touch("SystemWebview css:'[data-bind=\"events:{click: onAddMembershipsClick}\"]'")
end

Given /^I enter "([^\"]*)" on the search form on the Add Membership page$/ do |searchText|
	wait_for_element_exists("SystemWebView css:'.searchForm'")
    enter_text("SystemWebView css:'.searchForm'", searchText)
end