# Unlock keychain
lane :keychain_unlock do

  unlock_keychain(
    path: File.expand_path(ENV['PATH_KEYCHAIN']+ENV['KEYCHAIN_FILE_NAME']),
    password: ENV['CERTIFICATE_SIGNING_FILE_PASSWORD']
  )
  
end