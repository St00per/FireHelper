Pod::Spec.new do |s|
  s.name         = "FireHelper"
  s.version      = "1.0.0"
  s.summary      = "A short description of FireHelper."
  s.description  = "Amazingly pod for data swaggin"
  s.homepage     = "https://github.com/St00per/FireHelper"
  s.license      = "MIT"
  s.author             = { "Shteffen" => "kirillshteffen@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/St00per/FireHelper.git", :tag => "1.0.0" }
  s.source_files  = "FireHelper/**/*"

  #s.exclude_files = "Classes/Exclude"
  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #
  # s.framework  = "Firebase"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
 # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.
  # s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

   s.dependency "Firebase/Core"
   s.dependency "Firebase/Firestore"
   s.static_framework = true

end
