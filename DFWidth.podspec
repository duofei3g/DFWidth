Pod::Spec.new do |s|
 s.name         ="DFWidth"
 s.version      = "1.0.0"
 s.summary      = "A Strong Tool."
 s.homepage     = "https://github.com/duofei3g/DFWidth.git"
 s.license      = 'MIT'
 s.author       = { "duofei" => "duofei3g@163.com" }
 s.platform     = :ios
 s.ios.deployment_target = '7.0'
 s.source       = { :git => "https://github.com/duofei3g/DFWidth.git", :tag => "#{s.version}" }
 s.source_files  = 'DFWidth/*.{h,m}'
 s.exclude_files = "Classes/Exclude"
 s.requires_arc = true
 s.framework    = 'UIKit'

end
