Pod::Spec.new do |spec|

  spec.platform = :ios
  spec.name         = "ColoringBookSwift"
  spec.version      = "1.0.0"
  spec.requires_arc = true
  spec.summary      = "A short description of ColoringBookSwift."
  spec.description  = <<-DESC
  A much much longer description of ColoringBookSwift.
                      DESC
  spec.homepage     = 'https://github.com/mmhmobilearts/ColoringBookSwift'
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Mohamad" => "h.mohammad@smartmobiletech.org" }
  spec.source = { 
    :git => 'https://github.com/mmhmobilearts/ColoringBookSwift.git', 
    :tag => spec.version.to_s 
  }
  spec.framework = 'UIKit'
  spec.dependency 'XLPagerTabStrip', '~> 3.0'
  spec.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/XLPagerTabStrip"}
  spec.source_files  = "ColoringBookSwift/**/*.{h,m}"
  spec.resources = "ColoringBookSwift/**/*.{storyboard,xib,xcassets,lproj,png}"
  spec.public_header_files = "ColoringBookSwift/**/*.h"
  spec.ios.deployment_target = '14.0'

end
