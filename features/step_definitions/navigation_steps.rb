require 'calabash-android/calabash_steps'

Given /^I press the back button in the app$/ do
	touch('SystemWebView css:"a[data-role=backbutton]"')
end

Given /^I choose the "([^\"]*)" option from the drawer$/ do |drawerOption|
	drawerOptions = {
		"Add Memberships" => "click: onAddMembershipsClick",
		"My Memberships" => "click: onMymembershipClick",
		"New Perks" => "click: onNoticenterClick"
	}
	settingsOptions = {
		"Alert Preferences" => "click: onAlertPreferencesClick",
		"Profile" => "click: onEditProfileClick",
		"Support" => "click: onSupportClick",
		"About" => "click: onAboutClick",
		"Logout" => "click: onLogoutClick"
	}
	openSettings = false

	drawerEvent = drawerOptions[drawerOption]
	if drawerEvent.nil?
		drawerEvent = settingsOptions[drawerOption]
		if drawerEvent.nil?
			fail(msg="Invalid drawer option")
		else
			openSettings = true
		end
	end
	touch("SystemWebview css:'[href=\"#my-drawer\"]'")
	if openSettings
		sleep(1)
		touch("SystemWebView css:'.drawer-panelbar'")
	end
	touch("SystemWebview css:'[data-bind=\"events:{" + drawerEvent + "}\"]'")
end

Given /^I navigate to the "([^\"]*)" page from the header$/ do |page|
 	touch("SystemWebView css:'.inline-block' textContent:'" + page.tr(" ", "") + "'")
end 
