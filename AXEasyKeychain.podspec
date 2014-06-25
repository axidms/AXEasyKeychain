
Pod::Spec.new do |s|
  s.name             = "AXEasyKeychain"
  s.version          = File.read('VERSION')
  s.summary          = "Very easy and open source wrapper class for Keychain"
  s.homepage         = "https://github.com/axidms/AXEasyKeychain"
  s.license          = 'MIT'
  s.author           = { "Alexander Mertvetsov" => "amertvetsov@yandex.ru" }
  s.source           = { :git => "https://github.com/axidms/AXEasyKeychain.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{h,m}'
end
