#
# CocoaPods versoin 1.8.4
#

# source 'https://cdn.cocoapods.org/'
# fix for [!] Couldn't determine repo type for URL: `https://cdn.cocoapods.org/`: Failed to open TCP connection to cdn.cocoapods.org:443 (No route to host - connect(2) for "cdn.cocoapods.org" port 443)

source "https://github.com/CocoaPods/Specs.git"

platform :ios, '11.0'
use_modular_headers!

target 'ActiveCitizen' do
    pod 'Alamofire'
    pod 'YandexMapKit'
    pod 'YandexMapKitSearch'
    pod 'NVActivityIndicatorView'
    pod 'MaterialComponents/TextFields'
    pod 'moa'
    pod 'Auk'
    pod 'Kingfisher'
    pod 'Tabman'
    
    
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.name == 'Debug'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
    end
  end
end
