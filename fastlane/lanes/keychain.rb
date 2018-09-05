# Unlock keychan
lane :keychain_unlock do

  unlock_keychain(
    path: '~/Library/Keychains/login.keychain',
    password: '83c93j89t@',
    set_default: true
  )
  
end