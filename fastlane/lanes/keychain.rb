# Unlock keychain
lane :keychain_unlock do

  if Helper.ci?
    
    Dir.chdir ".." do
      sh('security set-key-partition-list -S apple-tool:,apple: -s -k 1q2w3e4r '+ File.expand_path(ENV['PATH_KEYCHAIN'] + 'login.keychain-db'))
    end

  end

end