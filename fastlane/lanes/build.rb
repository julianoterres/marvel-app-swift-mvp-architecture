# Run build and archive app
lane :make_build do

  config_provisioning_profile_backup()
  config_provisioning_profile_xcode()

  build_app(
    scheme: ENV['PROJECT_SCHEME'],
    workspace: ENV['PROJECT_WORKSPACE'],
    include_bitcode: true,
    output_directory: ENV['PATH_BUILD'],
    clean: true,
    export_method: 'app-store'
  )

  config_provisioning_profile_restore_backup()
  
end