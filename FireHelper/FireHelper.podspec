Pod::Spec.new do |s|
  s.name         = "FireHelper"
  s.version      = "1.0.0"
  s.summary      = "This pod is helping to move data documents around firebase"
  s.description  = "Amazingly pod for data swaggin"
  s.homepage     = "https://github.com/St00per/FireHelper"
  s.license      = "MIT"
  s.author             = { "Shteffen" => "kirillshteffen@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/St00per/FireHelper.git", :tag => "1.0.0" }
  s.source_files  = "FireHelper/**/*"
  s.dependency "Firebase/Core"
  s.dependency "Firebase/Firestore"
  s.static_framework = true

end
