

Given /^I search for "([^\"]*)" on the list$/ do |input|
    enter_text("SystemWebView css:'#perk-search-input'", input)
    touch("SystemWebView css:'.search.wrapped-icon'")
end