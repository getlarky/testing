require 'calabash-android/calabash_steps'

Given /^The bggeo license validation failure does not occur$/ do
	validation_text = "'License Validation Failure\nBackgroundGeolocation is running in evaluation mode.'"
	begin
		wait_for_element_exists("TextView text:" + validation_text, :timeout=>10)
		fail(msg="Found a license validation failure, test failed")
	rescue Calabash::Android::WaitHelpers::WaitError => e
		print "Did not find a license validation failure, test successful"
		assert(true)
	end

end