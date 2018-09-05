# Configuration jenkins
lane :jenkins_setup do

  setup_jenkins(
    keychain_path: '/Users/soft.jenkins/Library/Keychains/login.keychain',
    keychain_password: '1q2w3e4r'
  )
  
end