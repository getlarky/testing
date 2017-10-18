require 'calabash-android/calabash_steps'

Given /^The app has received a local notification$/ do
    target = evaluate_javascript("SystemWebView", "return (app.config.branding.brand)")[0]
    if !`adb shell dumpsys notification | grep -B 1 tickerText`.include? target
        fail(msg="The app has not received a local notification")
    end
end

Given /^The "([^\"]*)" app is now open$/ do |appName|
    wait_for(:timeout=>9){
        `adb shell 'dumpsys activity | grep top-activity'`.include? appName
    }
end

Given /^I switch to the last app$/ do
    system("adb shell input keyevent KEYCODE_APP_SWITCH")
    system("adb shell input keyevent KEYCODE_APP_SWITCH")
end