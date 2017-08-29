require 'calabash-android/calabash_steps'

Given /^I sign in with the zzz test account$/ do
    enter_text("SystemWebView css:'#email'", "normal@larky.com")
    enter_text("SystemWebView css:'#password'", "zzzzzz")
    tap_when_element_exists("SystemWebView css:'.button' textContent:'Sign in'")
end

Given /^I sign up with a random larky account$/ do
	randomId = Random.rand(1000000).to_s
    enter_text("SystemWebView css:'#signupEmail'", randomId + "@larky.com")
    enter_text("SystemWebView css:'#signupPassword'", "zzzzzz")
    signupButtonText = evaluate_javascript("SystemWebView", "return (app.config.branding.signupButtonLabel)")[0]
    tap_when_element_exists("SystemWebView css:'.button' textContent:'" + signupButtonText + "'")
end

Given /^The splash screen is gone$/ do
    sleep(5)
end

Given /^I press the sign up button$/ do
    signupButtonText = evaluate_javascript("SystemWebView", "return (app.config.branding.signupButtonLabel)")[0]
    wait_for_element_exists("SystemWebView css:'.button' textContent:'" + signupButtonText + "'")
    tap_when_element_exists("SystemWebView css:'.button' textContent:'" + signupButtonText + "'")
end