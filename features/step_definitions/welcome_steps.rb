require 'calabash-android/calabash_steps'

Given /^I sign in with the test account$/ do
    enter_text("SystemWebView css:'#email'", "normal@larky.com")
    enter_text("SystemWebView css:'#password'", "zzzzzz")
    tap_when_element_exists("SystemWebView css:'.button' textContent:'Sign in'")
end

Given /^I sign up with a random larky account$/ do
	randomId = Random.rand(1000000).to_s
    email_id, password_id, confirm_password_id = get_signup_ids()
    enter_text("SystemWebView css:" + email_id, randomId + "@larky.com")
    enter_text("SystemWebView css:" + password_id, "zzzzzz")
    print "Confirm pw: " + confirm_password_id
    if confirm_password_id != nil
        enter_text("SystemWebView css:" + confirm_password_id, "zzzzzz")
    end
    signupButtonText = evaluate_javascript("SystemWebView", "return (app.config.branding.signupButtonLabel)")[0]
    tap_when_element_exists("SystemWebView css:'.button' textContent:'" + signupButtonText + "'")
end

Given /^I press the sign up button$/ do
    signupButtonText = evaluate_javascript("SystemWebView", "return (app.config.branding.signupButtonLabel)")[0]
    wait_for_element_exists("SystemWebView css:'.button' textContent:'" + signupButtonText + "'")
    tap_when_element_exists("SystemWebView css:'.button' textContent:'" + signupButtonText + "'")
end


def get_signup_ids
    has_confirm_password = (evaluate_javascript("SystemWebView", "return (app.config.branding.skipConfirmPassword)")[0] != "true")
    is_cfcu = (evaluate_javascript("SystemWebView", "return (app.config.branding.brand)")[0] == "cfcu")
    email_id = "'#signupEmail'"
    password_id = "'#signupPassword'"
    confirm_password_id = nil
    if has_confirm_password
        confirm_password_id = "'#confirmPassword'"
    end
    if is_cfcu
        email_id = "'#cfcuSignupEmail'"
        password_id = "'#cfcuSignupPassword'"
        confirm_password_id = "'#cfcuConfirmPassword'"
    end

    return email_id, password_id, confirm_password_id
end