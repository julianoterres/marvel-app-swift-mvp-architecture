# Run tests and swiftlint
lane :execute_tests do
  
  swiftlint
  
  run_tests(
    workspace: ENV['PROJECT_WORKSPACE'],
    devices: ENV['TEST_DEVICES'],
    clean: true,
    scheme: ENV['PROJECT_SCHEME']
  )
  
end