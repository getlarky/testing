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
	if drawerOptions[drawerOption].nil?
		fail(msg="Invalid drawer option")
	end
	touch("SystemWebview css:'[href=\"#my-drawer\"]'")
	touch("SystemWebview css:'[data-bind=\"events:{" + drawerOptions[drawerOption] + "}\"]'")
end