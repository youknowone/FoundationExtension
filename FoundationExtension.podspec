Pod::Spec.new do |s|
  s.name         = "FoundationExtension"
  s.version      = "1.2.0"
  s.summary      = "Foundation/UIKit extension kit. It is category based and looks familiar to Foundation/UIKit. It includes many common snippets as shortcut."
  s.description  = <<-DESC
                    This library includes small Foundation/Cocoa/UIKit extensions. This library does not includes high-level data structure, algorithm or frameworks, but collection of code snippets.
                    * Many common snippets in a method call.
                    * Looks like native foundation methods - It follows Apple Coding Guideline and Foundation naming convention.
                    See document on [Github] (http://youknowone.github.com/FoundationExtension)

                    Try FoundationExtension for Foundation extensions.
                    For iOS, UIKitExtension is available too.
                   DESC
  s.homepage     = "https://github.com/youknowone/FoundationExtension"
  s.license      = "2-clause BSD"
  s.author       = { "Jeong YunWon" => "jeong@youknowone.org" }
  s.source       = { :git => "https://github.com/youknowone/FoundationExtension.git", :tag => "1.2.0" }
  s.dependency "cdebug", "~> 1.0"
  s.requires_arc = true
  s.osx.deployment_target = '10.9'
  s.ios.deployment_target = '7.0'

  s.subspec "FoundationExtensionRC" do |ss|
    ss.source_files = "FoundationExtensionRC/*.{h,m}"
    ss.public_header_files = "FoundationExtensionRC/*.h"
    ss.header_dir = "FoundationExtensionRC"
    ss.requires_arc = false
  end

  s.subspec "FoundationExtension" do |ss|
    ss.source_files = "FoundationExtension/*.{h,m}"
    ss.public_header_files = "FoundationExtension/*.h"
    ss.header_dir = "FoundationExtension"
    ss.dependency "FoundationExtension/FoundationExtensionRC"
  end

  s.subspec "CocoaExtension" do |ss|
    ss.platform     = :osx
    ss.source_files = "CocoaExtension/*.{h,m}"
    ss.public_header_files = "CocoaExtension/*.h"
    ss.header_dir = "CocoaExtension"
    ss.frameworks  = "Cocoa", "QuartzCore"
    ss.dependency "FoundationExtension/FoundationExtension"
  end

  s.subspec "UIKitExtension" do |ss|
    ss.platform     = :ios, '7.0'
    ss.source_files = "UIKitExtension/*.{h,m}"
    ss.public_header_files = "UIKitExtension/*.h"
    ss.header_dir = "UIKitExtension"
    ss.frameworks = "UIKit", "QuartzCore"
    ss.dependency "FoundationExtension/FoundationExtension"
  end

#  s.subspec "AddressBookExtension" do |ss|
#    ss.source_files = "AddressBookExtension/*.{h,m}"
#    ss.public_header_files = "AddressBookExtension/*.h"
#    ss.header_dir = "AddressBookExtension"
#    ss.requires_arc = false
#    ss.frameworks = "Foundation", "AddressBook"
#    ss.dependency "FoundationExtension/FoundationExtension"
#  end
end
