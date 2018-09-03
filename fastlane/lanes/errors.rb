# Triger when have error
error do |lane, exception, options|
  
  slack(
    message: ENV['PROJECT_NAME'] + ' failed fastlane deploy.  Target: ' + ENV['PROJECT_TARGET'] + ' Version: ' + get_version_number(target: ENV['PROJECT_TARGET']),
    success: false,
    slack_url: ENV['INTEGRATION_SLACK_UR']
  )

end