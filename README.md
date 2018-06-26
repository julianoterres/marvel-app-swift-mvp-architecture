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
	
