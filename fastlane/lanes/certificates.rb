# Run certificates production
lane :get_certificates_signing do
  
  # Revoke the certificates before create a new
  Spaceship::Portal.login(ENV['APPLE_ID'], ENV['FASTLANE_PASSWORD'])
  Spaceship::Portal.client.team_id = ENV['TEAM_ID']
  
  certificates = Spaceship::Certificate.all()
  
  certificates.each do |certificate|
    if certificate.owner_id == ENV['TEAM_ID']
      certificate.revoke!
    end
  end

  # Create a new certificate and download him
  get_certificates(
    development: ENV['CERTIFICATE_SIGNING_IS_DEVELOPMENT'],
    username: ENV['APPLE_ID'],
    output_path: ENV['PATH_CERTIFICATES_SIGNING'],
    team_id: ENV['TEAM_ID']
  )

end

# Run provisioning profile production
lane :get_certificates_provisioning_profile do

  # Delete the provisionig profiles before create a new
  Spaceship::Portal.login(ENV['APPLE_ID'], ENV['FASTLANE_PASSWORD'])
  Spaceship::Portal.client.team_id = ENV['TEAM_ID']
  
  provisioningsPprofiles = Spaceship::ProvisioningProfile.find_by_bundle_id(bundle_id: ENV['PROJECT_IDENTIFIER'])

  provisioningsPprofiles.each do |provisioningProfile|
    provisioningProfile.delete!
  end

  # Create a new provisionig profile and download him
  get_provisioning_profile(
    development: ENV['CERTIFICATE_PROVISIONING_PROFILE_IS_DEVELOPMENT'],
    app_identifier: ENV['PROJECT_IDENTIFIER'],
    username: ENV['APPLE_ID'],
    team_id: ENV['TEAM_ID'],
    filename: ENV['CERTIFICATE_PROVISION_PROFILE_NAME'],
    output_path: ENV['PATH_CERTIFICATES_PROVISION_PROFILE']
  )

end

# Run config provisioning profile
lane :config_provisioning_profile_xcode do

  backup_file(
    path: ENV['PROJECT_PBXPROJ']
  )

  disable_automatic_code_signing(
    path: ENV['PROJECT_XCODEPROJ'],
    use_automatic_signing: false
  )

  update_project_provisioning(
    xcodeproj: ENV['PROJECT_XCODEPROJ'],
    profile: ENV['PATH_CERTIFICATES_PROVISION_PROFILE'] + ENV['CERTIFICATE_PROVISION_PROFILE_NAME'],
    build_configuration: "Release",
    code_signing_identity: ENV['CERTIFICATE_SIGNING_NAME']
  )

  update_project_provisioning(
    xcodeproj: ENV['PROJECT_XCODEPROJ'],
    profile: ENV['PATH_CERTIFICATES_PROVISION_PROFILE'] + ENV['CERTIFICATE_PROVISION_PROFILE_NAME'],
    build_configuration: "Debug",
    code_signing_identity: ENV['CERTIFICATE_SIGNING_NAME']
  )

end

# Run config provisioning profile automatic
lane :config_provisioning_profile_xcode_automatic do

  restore_file(
    path: ENV['PROJECT_PBXPROJ']
  )
  
end