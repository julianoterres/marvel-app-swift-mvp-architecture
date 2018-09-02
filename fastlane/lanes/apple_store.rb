# Run create a App ID in apple developer
lane :create_app_store do
  
  produce(
    username: ENV['APPLE_ID'],
    itc_team_id: ENV['TEAM_ID_ITC'],
    app_identifier: ENV['PROJECT_IDENTIFIER'],
    app_name: ENV['PROJECT_NAME'],
    language: ENV['PROJECT_LANGUAGES'],
    team_name: ENV['TEAM_NAME']
  )
  
end

# Run upload app to itunes connect production
lane :send_apple_store do

  upload_to_app_store(
    force: true,
    overwrite_screenshots: true,
    username: ENV['APPLE_ID'],
    app_identifier: ENV['PROJECT_IDENTIFIER'],
    metadata_path: ENV['PATH_METADATA'],
    app_icon: ENV['PATH_METADATA'] + ENV['PROJECT_ICON_NAME'],
    ipa: ENV['PATH_BUILD'] + ENV['PROJECT_IPA_NAME'],
    app_rating_config_path: ENV['PATH_RATING'] + ENV['RATING_CONFIG_FILE_NAME'],
    submit_for_review: true,
    automatic_release: true,
    skip_binary_upload: true,
    screenshots_path: ENV['PATH_SCREENSHOTS'],
    submission_information: {
      add_id_info_limits_tracking: true,
      add_id_info_serves_ads: true,
      add_id_info_tracks_action: true,
      add_id_info_tracks_install: true,
      add_id_info_uses_idfa: true,
      content_rights_has_rights: true,
      content_rights_contains_third_party_content: true,
      export_compliance_platform: 'ios',
      export_compliance_compliance_required: false,
      export_compliance_encryption_updated: false,
      export_compliance_app_type: nil,
      export_compliance_uses_encryption: false,
      export_compliance_is_exempt: false,
      export_compliance_contains_third_party_cryptography: false,
      export_compliance_contains_proprietary_cryptography: false,
      export_compliance_available_on_french_store: false
    }
  )

end

# Run all steps to upload app to itunes connect production
lane :send_store do
  
  get_certificates_signing
  get_certificates_provisioning_profile
  install_pods
  execute_tests
  screenshots
  make_build
  send_apple_store
  slack_success

end