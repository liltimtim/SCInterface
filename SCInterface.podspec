#
# Be sure to run `pod lib lint SCInterface.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'SCInterface'
s.version          = '0.1.0'
s.summary          = 'Swift 3.0 for SoundCloud'
s.description      = 'Simple easy to use interface to SoundCloud'
s.homepage         = 'https://github.com/liltimtim/SCInterface'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Timothy Barrett' => 'liltimtim@gmail.com' }
s.source           = { :git => 'https://github.com/liltimtim/SCInterface.git', :tag => s.version.to_s }


  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'

s.source_files = 'SCInterface/Classes/**/*'

# s.resource_bundles = {
#   'SCInterface' => ['SCInterface/Assets/*.png']
# }
  s.dependency 'Alamofire', '~> 4.0.0'
  s.dependency 'AlamofireObjectMapper', '~> 4.0.0'
  s.dependency 'p2.OAuth2'
end
