require 'calabash-android/calabash_steps'

Given /^The "([^\"]*)" screen is present$/ do |id|
    wait_for(:timeout=>9){
        element_exists("SystemWebView css:'#" + id + "'")
    }
end

Given /^The splash screen is gone$/ do
    sleep(5)
end

# TODO: Combine w/ is present
Given /^The "([^\"]*)" screen is not present$/ do |id|
    wait_for(:timeout=>9){
        element_does_not_exist("SystemWebView css:'#" + id + "'")
    }
end

Given /^I press the larky "([^\"]*)" button$/ do |text|
    wait_for_element_exists("SystemWebView css:'.button' textContent:'" + text + "'")
    tap_when_element_exists("SystemWebView css:'.button' textContent:'" + text + "'")
end

Given /^I press the larky button with id "([^\"]*)"$/ do |id|
    touch("SystemWebView css:'#" + id + "'")
end

Given /^The "([^\"]*)" button exists$/ do |text|
    wait_for(:timeout=>3){
        element_exists("SystemWebView css:'.button' textContent:'" + text + "'")
    }
end

Given /^I enter "([^\"]*)" on the search form on the page$/ do |searchText|
    enter_text("SystemWebView css:'.searchForm'", searchText)
end

Given /^The loading screen is gone$/ do
    begin
        wait_for_element_exists("SystemWebView css:'.km-loader'") 
    rescue Calabash::Android::WaitHelpers::WaitError => e
        print "Loader must have triggered too fast, this is ok."
    end
    wait_for_element_does_not_exist("SystemWebView css:'.km-loader'") 
end

Given /^I wait one second$/ do
    sleep(1)
end