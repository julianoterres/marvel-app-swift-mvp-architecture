# Run upload app to itunes connect testflight
lane :send_app_testflight do

  upload_to_testflight(
    apple_id: ENV['APP_ID'],
    username: ENV['APPLE_ID'],
    app_identifier: ENV['PROJECT_IDENTIFIER'],
    ipa: ENV['PATH_BUILD'] + ENV['PROJECT_IPA_NAME'],
    skip_waiting_for_build_processing: false,
    distribute_external: true,
    testers_file_path: ENV['PATH_TESTERS_USERS'] + 'users.csv',
    groups: ENV['TEST_GROUPS'].split(','),
    notify_external_testers: true,
    changelog: read_changelog,
    beta_app_description: 'Description de teste',
    beta_app_feedback_email: ENV['OWNER_CONTACT_EMAIL'],
    email: ENV['OWNER_CONTACT_EMAIL'],
    wait_for_uploaded_build: true
  )

end

# Run add external users in testflight
lane :add_external_users do
  
  Spaceship::Tunes.login(ENV['APPLE_ID'], ENV['FASTLANE_PASSWORD'])
  Spaceship::Tunes.select_team
  Spaceship::TestFlight::Group.create!(app_id: ENV['APP_ID'], group_name: ENV['TEST_GROUPS_NAME'])

  Dir.chdir ".." do
    sh 'fastlane pilot import -c ./fastlane/testers/users.csv --username=' + ENV['APPLE_ID'] + ' --app_identifier=' + ENV['PROJECT_IDENTIFIER'] + ' --team_id=' + ENV['TEAM_ID_ITC']
  end

end

# Run all steps to upload app to itunes connect testflight
lane :send_testflight do
  
  get_certificates_and_provisioning_profile
  # add_external_users
  # install_pods
  # execute_tests
  make_build
  # send_app_testflight
  # slack_success
  
end