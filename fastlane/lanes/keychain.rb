# Unlock keychain
lane :keychain_unlock do

  # Check if keychain already exist
  if File.exist?(File.expand_path(ENV['PATH_KEYCHAIN']+ENV['KEYCHAIN_FILE_NAME']+'-db'))
    
    sh('security set-key-partition-list -S apple-tool:,apple: -s -k ' + ENV["CERTIFICATE_SIGNING_FILE_PASSWORD"] + ' '+ File.expand_path(ENV['PATH_KEYCHAIN']+ENV['KEYCHAIN_FILE_NAME']+'-db'))

  end

  # Check if is jenkins
  if Helper.ci?
    
    Dir.chdir ".." do
      sh('security set-key-partition-list -S apple-tool:,apple: -s -k 1q2w3e4r '+ File.expand_path(ENV['PATH_KEYCHAIN'] + 'login.keychain-db'))
    end

  end

end