Pod::Spec.new do |s|

  s.name         = "EXPLogger"
  s.version      = "1.0.3"
  s.summary      = "Simple and lightweight logger for Swift"
  s.homepage     = "https://github.com/atereshkov/EXPLogger.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Alexander Tereshkov" => "n1cs@bk.ru" }

  s.source       = { :git => "https://github.com/atereshkov/EXPLogger.git", :tag => s.version }

  # s.source_files  = "EXPLogger", "EXPLogger/**/*.{h,m,swift}"
  # s.source_files  = "EXPLogger/*.{h,m,swift}"
  s.source_files    = "EXPLogger/**/*.swift"

  s.platforms = { :ios => "9.0", :osx => "10.10", :watchos => "2.0", :tvos => "9.0" }

end
