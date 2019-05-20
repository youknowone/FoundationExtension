Pod::Spec.new do |s|
  s.name         = "FoundationExtension"
  s.version      = "2.1.0"
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
  s.license      = { :type => '2-clause BSD', :file => 'LICENSE' }
  s.author       = { "Jeong YunWon" => "jeong@youknowone.org" }
  s.social_media_url   = "http://twitter.com/youknowone_"
  s.source       = { :git => "https://github.com/youknowone/FoundationExtension.git", :tag => s.version }
  s.dependency "cdebug", "~> 1.3"
  s.requires_arc = true
  s.static_framework = true
  s.osx.deployment_target = '10.9'
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.header_dir = "FoundationExtension"

  s.subspec "FoundationExtensionRC" do |ss|
    ss.source_files = "FoundationExtension/*RC.h", "FoundationExtensionRC/*.m"
    ss.public_header_files = "FoundationExtension/*RC.h"
    ss.requires_arc = false
  end

  s.subspec "FoundationExtension" do |ss|
    ss.source_files = "FoundationExtension/*.{h,m}"
    ss.public_header_files = "FoundationExtension/*.h"
    ss.header_dir = "FoundationExtension"
    ss.dependency "FoundationExtension/FoundationExtensionRC"
  end
end
