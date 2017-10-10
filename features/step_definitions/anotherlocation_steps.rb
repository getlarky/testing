require 'calabash-android/calabash_steps'

Given /^I select the first location from google autocomplete$/ do
	tap_when_element_exists("SystemWebView css:'.pac-item:first-child'")
end