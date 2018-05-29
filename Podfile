# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'testFilmProject' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for testFilmProject
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '4.0'
          end
      end
  end
  pod 'youtube-ios-player-helper', '0.1.4'
  pod 'MBProgressHUD', '~> 1.1.0'
 
 target 'testFilmProjectTests' do
    inherit! :search_paths
    # Pods for testing
    post_install do |installer|
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
  pod 'youtube-ios-player-helper', '0.1.4'
  pod 'MBProgressHUD', '~> 1.1.0'
  end

  target 'testFilmProjectUITests' do
      post_install do |installer|
          installer.pods_project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['SWIFT_VERSION'] = '4.0'
              end
          end
      end
   
   inherit! :search_paths
    # Pods for testing
    pod 'youtube-ios-player-helper', '0.1.4'
    pod 'MBProgressHUD', '~> 1.1.0'
  end

end
