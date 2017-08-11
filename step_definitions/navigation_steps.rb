require 'calabash-android/calabash_steps'

Given /^I press the back button in the app$/ do |id|
	touch('SystemWebView css:"a[data-role=backbutton]"')
end