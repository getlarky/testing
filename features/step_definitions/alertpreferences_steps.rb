require 'calabash-android/calabash_steps'
is_first_blacklisted = false

Given /^I tap the first alert category$/ do 
	first_blacklisted_string = evaluate_javascript("SystemWebView", "return (app.alertpreferencesView.viewModel.perk_types._data[0].checked)")[0]
	is_first_blacklisted = (first_blacklisted_string == "true")
	touch("SystemWebView css:'#alertpreferences li:first-child'")
end

Given /^My blacklist preference for the first alert category should toggle$/ do
	first_blacklisted_string = evaluate_javascript("SystemWebView", "return (app.alertpreferencesView.viewModel.perk_types._data[0].checked)")[0]
	is_first_blacklisted_new = (first_blacklisted_string == "true")
 	if is_first_blacklisted == is_first_blacklisted_new
 		fail(msg="Blacklist status should have changed, but it has not. The first alert category has a blacklist status of " + is_first_blacklisted.to_s)
 	end
end 