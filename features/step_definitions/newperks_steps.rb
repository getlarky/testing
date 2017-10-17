require 'calabash-android/calabash_steps'

new_perks_count = 0

Given /^The number of new perks should match the count in the header$/ do
	new_perks_count = query("SystemWebView css:'.wrapped-icon.perks'")[0]["textContent"].to_i
	number_of_new_perks = query("SystemWebView css:'#noticenter .product'").count

	if new_perks_count != number_of_new_perks
		fail(msg="New perks count doesn't match number of new perks. Header count was " + new_perks_count.to_s +
			" and there were " + number_of_new_perks.to_s + " new perks")
	end
end

Given /^I click a new perk$/ do
	touch("SystemWebView css:'.product'")
end

Given /^The new perks count should decrease in the header$/ do
	new_new_perks_count = query("SystemWebView css:'.wrapped-icon.perks'")[0]["textContent"].to_i
	if new_perks_count != new_new_perks_count + 1
		fail(msg="Tapping a new perk did not decrease new perks count. Old count: " + new_perks_count.to_s +
			". New count: " + new_new_perks_count.to_s)
	end
end

Given /^The new perks page has loaded$/ do
	wait_for(:timeout=>8){
    	query("SystemWebView css:'#noticenter .product'").size > 0
    }
end