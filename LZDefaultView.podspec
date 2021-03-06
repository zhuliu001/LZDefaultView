#
# Be sure to run `pod lib lint LZDefaultView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LZDefaultView'
  s.version          = '0.2.3'
  s.summary          = 'A defaultView for VC'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zhuliu001/LZDefaultView.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '630775508@qq.com' => 'zhuliu001@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/zhuliu001/LZDefaultView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LZDefaultView/Classes/**/*'
  
   s.resource_bundles = {
     'LZDefaultView' => ['LZDefaultView/Assets/*']
   }
   
#   s.resource = ['LZDefaultView/Assets/*']

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.frameworks = 'UIKit','Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Masonry'
  
end
