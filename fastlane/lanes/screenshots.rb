# Run make screenshots
lane :generate_screenshots do
  
  capture_ios_screenshots(
    scheme: ENV['PROJECT_SCHEME_UI_TESTS'],
    devices: ENV['SCREENSHOTS_DEVICES'].split(','),
    output_directory: ENV['PATH_SCREENSHOTS'],
    output_simulator_logs: true,
    clear_previous_screenshots: true,
    skip_open_summary: true,
    languages: ENV['SCREENSHOTS_LANGUAGES'].split(',')
  )

  frame_screenshots(
    white: true
  )
  
end