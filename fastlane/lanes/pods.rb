# Install pod dependencies
lane :install_pods do
  
  cocoapods(
    use_bundle_exec: false,
    clean: true,
    podfile: "./Podfile"
  )
  
end