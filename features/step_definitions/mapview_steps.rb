require 'calabash-android/calabash_steps'

Given /^Map view is loaded "([^\"]*)" perks count$/ do |includePerkCount|
    # wait_for_element_exists("SystemWebView css:'.km-loader'")
    # TODO: something that c/b scaled to other pages/that makes more sense?
    wait_for(:timeout=>30){
    	(query("SystemWebView css:'.map-marker-icon'").size > 0 ) or element_exists("SystemWebView css:'#mapNoSearchResultUL'")
    }
    if includePerkCount != "without"
	    wait_for_element_exists('SystemWebView css:"#perkscount"')
	    wait_for(:timeout=>5){element_does_not_exist('SystemWebView css:"#perkscount"')}
    else
        sleep(2)
    end
end

Given /^I open a perk from the map view$/ do
    sleep(2)
    tap_when_element_exists("SystemWebView css:'.map-marker'")
    tap_when_element_exists("SystemWebView css:'.infoBox'")
end

Given /^I clear the search on the map$/ do
	touch("SystemWebView css:'.km-filter-reset'")
end

Given /^I search for "([^\"]*)" on the map$/ do |input|
	enter_text("SystemWebView css:'#map-search-input'", input)
	touch("SystemWebView css:'#map-search-go-btn'")
end

Given /^I tap the map to clear the keyboard$/ do
	touch("SystemWebView css:'#mapcanvas'")
end

Given /^The no search results ul is shown$/ do
	wait_for(:timeout=>8) {element_exists("SystemWebView css:'#mapNoSearchResultUL'")}
end

Given /^There should be a "([^\"]*)" filter set to "([^\"]*)"$/ do |page, filterContent|
    if page == "map"
        pageId = "\#mapview"
    elsif page == "list"
        pageId = "\#allperks"
    else
        fail(msg="Invalid page for filter selections. Options are: list, map.")
    end

    wait_for_element_exists("SystemWebView css:'" + pageId + " .k-input' textContent:'" + filterContent + "'")
end

Given /^I view the map as a list$/ do
    touch("SystemWebView css:'#map-view-as-list'")
end

Given /^I clear the welcome message$/ do
    touch("SystemWebView css:'.intro-cancel-button'")
end

Given /^The map location filter should be set to the home base$/ do
    homeBase = evaluate_javascript("SystemWebView", "return (app.config.branding.noPerkLocation.city)")[0]
    wait_for_element_exists("SystemWebView css:'.k-input' textContent:'" + homeBase + "'")
end