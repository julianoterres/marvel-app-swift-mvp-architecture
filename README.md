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

## Setup project

To you to setup the project with all dependencies that is necessary to that the project working correct, just you execute the file setup.sh with command below

	sh setup.sh

This file contains all commands to install all dependencies that you need install.

## Fastlane

This project contains how tool of the automator process, the fastlane.

With the follow commands listing bellow:

	install_pods
	all_tests
	screenshots
	create_app_itunes
	download_certificates
	download_provisioning_profile
	app_build
	send_production
	send_testfligth
	
	
## Continuous Integration

This projeto have how CI the Bitrise. If you want see the CI config , we have a config file in project root folder called bitrise.yml. But if you want see the logs of bibtrise, you can see the CI logs, in the gitlab pipelines [clicking here].

[clicking here]:https://gitlab.com/julianoterres/marvel/pipelines
	
## Unit Tests

This app has unit tests, and to date the percentage coverage is 96%.
