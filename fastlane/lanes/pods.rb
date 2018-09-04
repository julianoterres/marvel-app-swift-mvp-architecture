# Install pod dependencies
lane :install_pods do
  
  cocoapods(
    repo_update: true,
    use_bundle_exec: false,
    clean: true,
    podfile: "./Podfile"
  )
  
end