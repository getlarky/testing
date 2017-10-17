require 'calabash-android/calabash_steps'
signup_redirect = true

Given /^I check whether or not my app has an auto\-added membership$/ do
    signup_redirect = (evaluate_javascript("SystemWebView", "return (app.config.branding.addMemberships)")[0] != "null")
end

Given /^Map view is loaded "([^\"]*)" perks count$/ do |includePerkCount|
    # wait_for_element_exists("SystemWebView css:'.km-loader'")
    # TODO: something that c/b scaled to other pages/that makes more sense?
    if signup_redirect
        wait_for(:timeout=>30){
        	(query("SystemWebView css:'.map-marker-icon'").size > 0 ) or element_exists("SystemWebView css:'#mapNoSearchResultUL'")
        }
        if includePerkCount != "without"
    	    wait_for_element_exists("SystemWebView css:'#perkscount'")
    	    wait_for(:timeout=>5){element_does_not_exist("SystemWebView css:'#perkscount'")}
        else
            sleep(2)
        end
    else
        print "Your app doesn't redirect on signup. Map view won't load"
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
    if signup_redirect
        touch("SystemWebView css:'.intro-cancel-button'")
    else
        print "Your app doesn't redirect on signup. Map view won't load"
    end
end

Given /^The map location filter should be set to the home base$/ do
    if signup_redirect
        homeBase = evaluate_javascript("SystemWebView", "return (app.config.branding.noPerkLocation.city)")[0]
        wait_for_element_exists("SystemWebView css:'.k-input' textContent:'" + homeBase + "'")
    else
        print "Your app doesn't redirect on signup. Map view won't load"
    end
    # Sign up flow ends here.
    signup_redirect = false
end

Given /^I tap the question mark icon$/ do
    touch("SystemWebView css:'#mapview .helpIcon'")
end

Given /^I should see the help overlay$/ do
    wait_for_element_exists("SystemWebView css:'#mapview .infoOverlay'")
end

Given /^I clear the help overlay$/ do 
    touch("SystemWebView css:'#mapview .infoOverlay .intro-cancel-button'")
    sleep(1)
end