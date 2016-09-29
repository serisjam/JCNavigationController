#
#  Be sure to run `pod spec lint JCNavigationController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "JCNavigationController"
  s.version      = "1.0.1"
  s.summary      = "JCNavigationConroller是一个可以在不同页面自定义NavigationBar样式，而且互相不影响"

  s.description  = <<-DESC
                    支持StroyBoard xib code 不影响原有的导航栏的navigationItem和其他navigationBar的属性,包括设置的barTintColor,backgroundImage等
                   DESC

  s.homepage     = "https://github.com/SerilesJam/JCNavigationController"
  #s.screenshots  = "https://github.com/SerilesJam/JCNavigationController/blob/master/demo.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license          = { :type => 'MIT', :file => 'LICENSE' }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author             = { "Jam" => "hxjiamiao@126.com" }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "7.0"
  s.requires_arc = true


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/SerilesJam/JCNavigationController.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.subspec 'JCNavigationController' do |ss|
    ss.source_files  = '*'
  end
end
