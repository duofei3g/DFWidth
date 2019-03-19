#
#  Be sure to run `pod spec lint DFWidth.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
 s.name         ="DFWidth"
 s.version      = "1.0.0"
 s.summary      = "A Strong Tool."
 s.homepage     = "https://github.com/duofei3g/DFWidth.git"
 s.license      = { :type => "MIT", :flie=>"LICENSE" }
 s.author             = { "duofei" => "duofei3g@163.com" }
 s.platform     = :ios,'9.0'
 s.source       = { :git => "https://github.com/duofei3g/DFWidth.git", :tag => "#{s.version}" }
 s.source_files  = "DFWidth/*.{h,m}"
 s.exclude_files = "Classes/Exclude"
 s.requires_arc = true
end
