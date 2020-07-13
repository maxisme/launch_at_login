#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint launch_at_login.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'launch_at_login'
  s.version          = '0.0.2'
  s.summary          = 'Run MacOS app on login.'
  s.homepage         = 'https://max.me.uk'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'max@max.me.uk' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
