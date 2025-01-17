Pod::Spec.new do |s|
  s.name             = 'SiteimproveAppAnalytics'
  s.version          = '1.1.0'
  s.summary          = 'SiteimproveAppAnalytics iOS SDK'
  s.description      = 'SiteimproveAppAnalytics SDK enables user behavior tracking in iOS applications. Integration requires a Siteimprove API key.'

  s.author           = { 'Stefan Aleksiev' => 'stefan.aleksiev@lab08.com', 'Ivan Dortulov' => 'ivan.dortulov@lab08.com', 'Muskan' => 'mus@siteimprove.com' }

  s.source = { :http => "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/#{s.version}/SiteimproveAppAnalytics.xcframework.zip" }
  s.vendored_frameworks = "**/SiteimproveAppAnalytics.xcframework"
  s.ios.deployment_target = '15.0'

  s.homepage         = 'https://siteimprove.com'
  s.documentation_url = 'https://github.com/Siteimprove/appanalytics-ios-sdk-public'
  s.license          = { :type => 'MIT', :text => <<-LICENSE
Copyright (c) 2024 Siteimprove

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR I
LICENSE
               }
end