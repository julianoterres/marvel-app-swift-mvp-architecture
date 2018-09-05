# Run certificates production
lane :get_certificates_and_provisioning_profile do
  
  # Revoke the certificates before create a new
  Spaceship::Portal.login(ENV['APPLE_ID'], ENV['FASTLANE_PASSWORD'])
  Spaceship::Portal.client.team_id = ENV['TEAM_ID']
  
  certificates = Spaceship::Certificate.all()
  generateNewCertificate = true
  certificateId = ''
  
  certificates.each do |certificate|
    if certificate.name == 'iOS Distribution' && certificate.owner_id == ENV['TEAM_ID']
      if certificate.expires < Time.now.utc
        certificate.revoke!
      else
        generateNewCertificate = false
        certificateId = certificate.id
      end
    end
  end

  if generateNewCertificate

    # Get current branch to when finished process git, make checkout in current branch
    currentBranch = git_branch()

    # Make checkout develop to commit new certificates
    Dir.chdir ".." do
      sh 'git checkout .'
      sh 'git checkout develop'
    end
    
    # Create a new certificate and download him
    certificateId = get_certificates(
      development: ENV['CERTIFICATE_SIGNING_IS_DEVELOPMENT'],
      username: ENV['APPLE_ID'],
      output_path: ENV['PATH_CERTIFICATES_SIGNING'],
      team_id: ENV['TEAM_ID'],
      keychain_password: ENV['CERTIFICATE_SIGNING_P12_PASSWORD']
    )

    p12OldFile = ENV['PATH_CERTIFICATES_SIGNING'] + certificateId + '.p12'
    p12NewFile = ENV['PATH_CERTIFICATES_SIGNING'] + ENV['CERTIFICATE_SIGNING_FILE_DISTRIBUTION'] + '.p12'

    cerOldFile = ENV['PATH_CERTIFICATES_SIGNING'] + certificateId + '.cer'
    cerNewFile = ENV['PATH_CERTIFICATES_SIGNING'] + ENV['CERTIFICATE_SIGNING_FILE_DISTRIBUTION'] + '.cer'

    certSigningRequestOldFile = ENV['PATH_CERTIFICATES_SIGNING'] + certificateId + '.certSigningRequest'
    certSigningRequestNewFile = ENV['PATH_CERTIFICATES_SIGNING'] + ENV['CERTIFICATE_SIGNING_FILE_DISTRIBUTION'] + '.certSigningRequest'

    # Delete the provisionig profiles before create a new
    Spaceship::Portal.login(ENV['APPLE_ID'], ENV['FASTLANE_PASSWORD'])
    Spaceship::Portal.client.team_id = ENV['TEAM_ID']
    
    provisioningsPprofiles = Spaceship::ProvisioningProfile.find_by_bundle_id(bundle_id: ENV['PROJECT_IDENTIFIER'])

    provisioningsPprofiles.each do |provisioningProfile|
      provisioningProfile.delete!
    end

    install_provisioning_profile(
      certificateId: certificateId
    )

    # Change name of certificates to default
    Dir.chdir ".." do
      sh 'mv ' + p12OldFile + ' ' + p12NewFile
      sh 'mv ' + cerOldFile + ' ' + cerNewFile
      sh 'mv ' + certSigningRequestOldFile + ' ' + certSigningRequestNewFile
    end

    # Commit new certificates to develop
    Dir.chdir ".." do
      sh 'git add .'
      sh 'git commit -m "New certificates generated"'
      sh 'git push origin develop'
    end

    # Merge new certificates in master
    Dir.chdir ".." do
      sh 'git checkout master'
      sh 'git merge --no-ff develop'
      sh 'git push origin master'
    end

    # Merge new certificates in current branch
    Dir.chdir ".." do
      sh 'git checkout ' + currentBranch
      sh 'git merge --no-ff master'
      sh 'git push origin ' + currentBranch
    end

  end

  # Install cer certificate
  import_certificate(
    keychain_name: 'login',
    certificate_path: ENV['PATH_CERTIFICATES_SIGNING'] + ENV['CERTIFICATE_SIGNING_FILE_DISTRIBUTION'] + '.cer',
    certificate_password: ENV["CERTIFICATE_SIGNING_FILE_PASSWORD"]
  )

  # Install P12 certificate
  import_certificate(
    keychain_name: 'login',
    certificate_path: ENV['PATH_CERTIFICATES_SIGNING'] + ENV['CERTIFICATE_SIGNING_FILE_DISTRIBUTION'] + '.p12',
    certificate_password: ENV["CERTIFICATE_SIGNING_FILE_PASSWORD"]
  )

  # Install the provisionig profile
  if !generateNewCertificate

    install_provisioning_profile(
      certificateId: certificateId
    )

  end

end

# Install the provisionig profile
lane :install_provisioning_profile do |values|

  # Create a new provisionig profile and download him
  get_provisioning_profile(
    development: ENV['CERTIFICATE_PROVISIONING_PROFILE_IS_DEVELOPMENT'],
    app_identifier: ENV['PROJECT_IDENTIFIER'],
    username: ENV['APPLE_ID'],
    team_id: ENV['TEAM_ID'],
    filename: ENV['CERTIFICATE_PROVISION_PROFILE_NAME'],
    output_path: ENV['PATH_CERTIFICATES_PROVISION_PROFILE'],
    cert_id: values[:certificateId]
  )

end

# Run config provisioning profile
lane :config_provisioning_profile_xcode do

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

# Run config provisioning profile backup
lane :config_provisioning_profile_backup do

  backup_file(
    path: ENV['PROJECT_PBXPROJ']
  )
  
end

# Run config provisioning profile restore backup
lane :config_provisioning_profile_restore_backup do

  restore_file(
    path: ENV['PROJECT_PBXPROJ']
  )
  
end