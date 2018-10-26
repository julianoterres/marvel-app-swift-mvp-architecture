# MARVEL APP

Hello! This is steps to run the Marvel App in your Xcode

## Architecture

This project was building using the MVP pattern

## Clone repository

If you don't have git installed in your mac, you need install following the [documentation of git].

[documentation of git]:https://git-scm.com/download/mac

The first step, is clone the repository in your mac. To this create a directory in your mac and open that directory in your terminal app.

When you be inside the app directory in terminal, execute the follow commands below:


	git init
	git remote add origin git@gitlab.com:julianoterres/ios-app-marvel.git
	git fetch
	git checkout master

## Setup project

To you to setup the project with all dependencies that is necessary to that the project working correct, just you execute the file setup.sh with command below.

	sh setup.sh

This file contains all commands to install all dependencies that you need install.

## Fastlane

This project contains how tool of the automator process, the fastlane.

### Individual Commands

Bellow have the commands that you can run individuality.

	create_app_store
	get_certificates_and_provisioning_profile
	keychain_unlock
	install_pods
	generate_screenshots
	add_external_users
	execute_tests
	make_build
	
### Send to testflight

Below have the command that send app to testflight

	send_testflight

that execute in order the commands bellow:

1. keychain_unlock
2. get_certificates_and_provisioning_profile
3. add_external_users
4. install_pods
5. execute_tests
6. make_build
7. send_app_testflight
8. slack_success

### Send to apple store

Below have the command that send app to apple store (production)

	send_store

that execute in order the commands bellow:

1. keychain_unlock
2. get_certificates_and_provisioning_profile
3. install_pods
4. execute_tests
5. generate_screenshots
6. make_build
7. send_apple_store
8. slack_success


	
## Crashes Tracking

This project use the Firebase to monitor the crashes in app.
	
## Continuous Integration

This project have how CI the Bitrise. If you want see the CI config , we have a config file in project root folder called bitrise.yml. But if you want see the logs of bibtrise, you can see the CI logs, in the gitlab pipelines [clicking here].

[clicking here]:https://gitlab.com/julianoterres/marvel/pipelines
	
## Unit Tests

This app has unit tests, and to date the percentage coverage is 71%.
