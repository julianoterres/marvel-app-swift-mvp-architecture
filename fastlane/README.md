fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios run_all_tests
```
fastlane ios run_all_tests
```
Run tests and swiftlint
### ios run_screenshots
```
fastlane ios run_screenshots
```
Run make screenshots
### ios run_create_app_itunes
```
fastlane ios run_create_app_itunes
```
Run create a App ID in apple developer
### ios run_get_certificates_production
```
fastlane ios run_get_certificates_production
```
Run certificates production
### ios run_provisioning_profile_production
```
fastlane ios run_provisioning_profile_production
```
Run provisioning profile production
### ios run_config_provisioning_profile
```
fastlane ios run_config_provisioning_profile
```
Run config provisioning profile
### ios run_config_provisioning_profile_automatic
```
fastlane ios run_config_provisioning_profile_automatic
```
Run config provisioning profile automatic
### ios run_build_app
```
fastlane ios run_build_app
```
Run build and archive app
### ios run_send_store
```
fastlane ios run_send_store
```
Run upload app to itunes connect production
### ios run_send_testfligth
```
fastlane ios run_send_testfligth
```
Run upload app to itunes connect testfligth
### ios send_production
```
fastlane ios send_production
```
Run all steps to upload app to itunes connect production
### ios send_testfligth
```
fastlane ios send_testfligth
```
Run all steps to upload app to itunes connect testfligth

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
