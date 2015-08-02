#
# Be sure to run `pod lib lint StatusBarKit.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "StatusBarKit"
  s.version          = "0.1.0"
  s.summary          = "StatusBarKit provide customize statusbar like iOS 9"
  s.description      = <<-DESC
                       StatusBarKit is customize stasubar module.

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/himaratsu/StatusBarKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ryosuke Hiramatsu" => "himaratsu@gmail.com" }
  s.source           = { :git => "https://github.com/himaratsu/StatusBarKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/himara2'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'StatusBarKit' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
