Pod::Spec.new do |s|
  s.name         = "CocoaExtension"
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
  s.license      = "2-clause BSD"
  s.author       = { "Jeong YunWon" => "jeong@youknowone.org" }
  s.social_media_url   = "http://twitter.com/youknowone_"
  s.source       = { :git => "https://github.com/youknowone/FoundationExtension.git", :tag => s.version }
  s.dependency "cdebug", "~> 1.3"
  s.requires_arc = true
  s.static_framework = true
  s.osx.deployment_target = '10.9'

  s.source_files = "CocoaExtension/*.{h,m}"
  s.public_header_files = "CocoaExtension/*.h"
  s.header_dir = "CocoaExtension"
  s.frameworks  = "Cocoa", "QuartzCore"
  s.dependency "FoundationExtension", "~> 2.1.0"
end
