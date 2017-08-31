# Welcome to Larky automated testing!

### Getting Started

1. To see how this all began, read up on https://github.com/getlarky/android/issues/1257
1. To get started running/writing tests, first install calabash. I prefer the ruby instructions on this [tutorial](https://bitbar.com/how-to-setup-and-get-started-with-calabash/), since it's less forceful than the cURL option.
1. Run `calabash-android`. Ensure you see a help message saying something like: `Usage: calabash-android <command-name> [parameters] [options]`
1. Clone this repo!
1. Ensure you're in the home directory. You should see a folder called `features`.
1. Build or obtain a debug apk larky app. Note the path of the app.
1. Plug in your Android devices and make sure you can see it when you run the command `adb devices`. If it doesn't show up, switch your debugging mode to `Transfer Photos (PTP)`;
1. Run command `calabash-android run <path_to_debug_apk>`.
1. If you see a message telling you to resign the file, just run the suggested command. It won't hurt!
1. See the tests run!

### The dudcatcher!!

This is our first automated test. It verifies an android apk to make sure it's free of our most common mistakes when building. For more background, see the [relevant issue](https://github.com/getlarky/android/issues/1282).

**Steps for setup:**

1. Set up a `LARKY_HOME` environment variable in your ~/.bash_profile. It should point to the `android/larky` directory. If you see a message like `cmp: assets/www/images/larkylogo.png: No such file or directory`, it's because this variable is not set.
1. Get bash >= 4.0. You can do this by running `brew update && brew install bash`
1. Ensure you can run the command `aapt` in the terminal.
1. Ensure you can run the above calabash test :point_up:

**Steps to run:**

1. Get a debug apk!
1. Go to the `testing/` home directory
1. Run `./dudcatcher.sh <target> <path_to_apk>`.

You should see output regarding apptentive, branding, bggeo license, and signup/home base!!

### Dope ass console

1. You can also run `calabash-android run <path_to_debug_apk>`. You should see an irb menu come up.
1. From here, run `start_test_server_in_background`. Your app should come up on your phone!
1. This is a really useful console where you can query for elements and test out your test steps before you try them! Start out running `query(*)` and read more [here](https://blog.testmunk.com/a-guide-to-automate-ui-testing-for-phonegap-cordova-apps/)!

### Important files

- The `.feature` file lays out the flow of the test. It has no low level information.
- Implementations of the "steps" are in the `step_definitions` folder. Smaller step files that pertain to individual concepts are preferable (especially since they're so easy to make!).

That's it for now!! This will grow as more tests get written, but it's pretty easy to pick up!
