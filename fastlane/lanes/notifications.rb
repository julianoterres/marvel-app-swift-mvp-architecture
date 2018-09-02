# Run slack when success
lane :slack_success do

  slack(
    message: ENV['PROJECT_NAME'] + ' success upload to apple store. Target: ' + ENV['PROJECT_TARGET'] + ' Version: ' + get_version_number(target: ENV['PROJECT_TARGET']),
    success: true,
    slack_url: ENV['INTEGRATION_SLACK_UR']
  )
  
end