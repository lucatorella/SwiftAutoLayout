Pod::Spec.new do |s|

  s.name         = "SwiftAutolayout"
  s.version      = "0.1.1"
  s.summary      = "SwiftAutoLayout is a UIView extension to easily create Auto Layout constraints."

  s.description  = <<-DESC
                   SwiftAutoLayout is a UIView extension to easily create Auto Layout constraints. Auto Layout is a powerful tool, but it's often very verbose. This extension try to simplify some of the common uses of Auto Layout with some handy methods.
                   DESC

  s.homepage     = "https://github.com/lucatorella/SwiftAutoLayout"

  s.license      = "MIT"

  s.author             = { "Luca Torella" => "lucatorella@gmail.com" }
  s.social_media_url   = "http://twitter.com/lucatorella"

  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.9"

  s.source       = { :git => "https://github.com/lucatorella/SwiftAutolayout.git", :tag => "0.1.1" }

  s.source_files  = "Classes"

  s.requires_arc = true

end
