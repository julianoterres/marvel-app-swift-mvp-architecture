# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
inhibit_all_warnings!

target 'Marvel' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Marvel
  pod 'Alamofire', '~> 4.7'
  pod 'Kingfisher', '~> 4.8'
  pod 'Fabric', '~> 1.7.13'
  pod 'Crashlytics', '~> 3.10.9'
  pod 'Firebase/Core'

  target 'MarvelTests' do
    inherit! :search_paths
    # Pods for testing
  end

  #target 'MarvelUITests' do
  #  inherit! :search_paths
    # Pods for testing
  #end

  post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
      end
    end
  end

end
