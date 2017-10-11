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

Given /^I select "([^\"]*)" from a filter$/ do |filterSelection|
    touch("SystemWebView css:'.k-item' textContent:'" + filterSelection + "'")
end

Given /^The "([^\"]*)" search term should be set to "([^\"]*)"$/ do |page, term|
    pageViewModel = "app."
    if page == "map"
        pageViewModel += "allperksView"
    elsif page == "list"
        pageViewModel += "mapView"
    else
        fail(msg="Invalid page. Options are: list, map.")
    end
    pageViewModel += ".viewModel.term"
    appTerm = evaluate_javascript("SystemWebView", "return (" + pageViewModel + ")")[0]

    if appTerm != term
        fail(msg="Search term not correctly set. Expected: " + term + ", but got: " + appTerm)
    end
end

Given /^I touch the "([^\"]*)" "([^\"]*)" filter$/ do |page, filterType|
    pageId = ""
    if page == "map"
        pageId = "\#mapview"
    elsif page == "list"
        pageId = "\#allperks"
    else
        fail(msg="Invalid page for filter selections. Options are: list, map.")
    end

    filterSelector = ""

    if filterType == "category"
        filterSelector = ".categoryFilterUL"
    elsif filterType == "location"
        filterSelector = ".perkFilter:not(.categoryFilterUL)"
    else
        fail(msg="Invalid filter type for filter selections. Options are: list, map.")
    end

    touch("SystemWebView css:'" + pageId + " .footer-nav-container " + filterSelector + "'")
end