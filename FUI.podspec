#
# Be sure to run `pod lib lint FUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name             = 'FUI'
  spec.version = "0.0.2"
  spec.summary          = 'A convenient library for UI-related processing'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  spec.description      = <<-DESC
A convenient library for UI-related processing, which can later be included in project templates as well.
                       DESC

  spec.homepage         = 'https://github.com/fanthus/FUI'
  # spec.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'fanthus' => 'fanthus@163.com' }
  spec.source           = { :git => 'https://github.com/fanthus/FUI.git', :tag => spec.version.to_s }
  # spec.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  spec.ios.deployment_target = '12.0'

  spec.source_files = 'FUI/Classes/**/*'
  
  # spec.resource_bundles = {
  #   'FUI' => ['FUI/Assets/*.png']
  # }

  # spec.public_header_files = 'Pod/Classes/**/*.h'
  spec.frameworks = 'UIKit'
  spec.dependency 'FRCategories', '~> 0.0.1'
end
