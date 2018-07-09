# MARVEL APP

Hello! This is steps to run the Marvel App in your Xcode


## Clone repository

If you don't have git installed in your mac, you need install following the [documentation of git].

[documentation of git]:https://git-scm.com/download/mac

The first step, is clone the repository in your mac. To this create a directory in your mac and open that directory in your terminal app.

When you be inside the app directory in terminal, execute the follow commands below:


	git init
	git remote add origin git@gitlab.com:julianoterres/marvel.git
	git fetch
	git checkout master

## Install CocoaPods

If you don't have cocoapods installed in your mac, you need install following the [documentation of cocoapods].

[documentation of cocoapods]:https://cocoapods.org/

After you execute the commands above in yout terminal app, the app project already be in you mac. To install the third dependencies execute the follow commands below inside the app directory using your terminal app.

	pod install
	
And wait until all the dependencies are installed.

After all the dependencies are installed, cocoa pods will create a file in the root of your project with the name of your project containing the extension "xcworkspace", from that moment on, you should always open your project for this file.

## Fastlane

This project contains a fastlane to run tests and make a screenshots.

If you want run tests with fastlane, enough you enter in directory of project and run command below

	fastlane tests

And if you want generate a screenshots with fastlane enough enter in directory of project and run command below

	fastlane screenshots
	
## Continuous Integration

This projeto have how CI Bitrise, and if you see the config CI, we have a config file in project root folder called bitrise.yml, and you can follow the logs of bitrise in CI Pipelines of gitlab [clicando aqui].

[clicando aqui]:https://gitlab.com/julianoterres/marvel/pipelines
	
## Unit Tests

This app has unit tests, and to date the percentage coverage is 96%.

## Screenshots

If you want see the screenshots of the aap, they was saved in the screenshots folder, in the respective language folder.