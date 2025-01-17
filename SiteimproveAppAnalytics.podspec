Pod::Spec.new do |s|
  s.name             = 'SiteimproveAppAnalytics'
  s.version          = '1.1.0'
  s.summary          = 'SiteimproveAppAnalytics iOS SDK'
  s.description      = 'SiteimproveAppAnalytics SDK enables user behavior tracking in iOS applications. Integration requires a Siteimprove API key.'

  s.homepage         = 'https://siteimprove.com'
  s.documentation_url = 'https://github.com/Siteimprove/appanalytics-ios-sdk-public'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Stefan Aleksiev' => 'stefan.aleksiev@lab08.com', 'Ivan Dortulov' => 'ivan.dortulov@lab08.com', 'Muskan' => 'mus@siteimprove.com' }

  s.source = { :http => "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/#{s.version}/SiteimproveAppAnalytics.xcframework.zip" }
  s.vendored_frameworks = "SiteimproveAppAnalytics.xcframework"
  s.ios.deployment_target = '15.0'
end