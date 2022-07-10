# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CityBuy' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CityBuy
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'FirebaseUI'
  pod 'Firebase/Storage'
  pod 'FirebaseFirestore'
  pod 'FirebaseFirestoreSwift'

  post_install do |installer|
      installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
        end
      end
    end
end
