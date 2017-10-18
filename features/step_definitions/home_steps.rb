require 'calabash-android/calabash_steps'

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