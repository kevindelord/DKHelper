#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "DKHelper"
  s.version          = "0.1.0"
  s.summary          = "Bunch of categorized class to inmprove your iOS development."
  s.homepage         = "https://github.com/kevindelord/DKHelper"
  s.license          = 'MIT'
  s.author           = { "kevindelordw" => "delord.kevin@gmail.com" }
  s.source           = { :git => "https://github.com/kevindelord/DKHelper.git", :tag => s.version.to_s }
  s.requires_arc     = true
  s.source_files     = 'DKHelper.{h,m}'
end
