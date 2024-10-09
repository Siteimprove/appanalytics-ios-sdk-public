# AppAnalytics iOS SDK

## Contents

- [Requirements](#requirements)
- [Configuring the SDK](#configuring-the-sdk)
- [SDK API](#sdk-api)
- [Events Tracking](#events-tracking)

## Requirements
The minimum deployment target is iOS 15.

## Installation
You can install the Siteimprove SDK using the Swift Package Manager or by manually downloading and adding it to your project.

### Swift Package Manager (preferred)
In Xcode, add a package dependency to your project using the following URL:  
```swift
https://github.com/Siteimprove/appanalytics-ios-sdk-public
```

### Manual
The XCFramework can be downloaded from our [release page] (add link to the release page of the SDK). After unzipping, place the XCFramework in the Framework Search Paths of your Xcode project, import it into the project, and configure it to `Embed & Sign`.

## Configuring the SDK
Our suggestion for configuring the Siteimprove AppAnalytics is to do so in the AppDelegate.
You must provide an API key as well as region:
- r1 - EU
- r2 - US

The following is an example of how this could be done:

```swift
import SiteimproveAppAnalytics

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Siteimprove.shared.configure(apiKey: "Your-API-Key", region: "r1")
        return true
    }
}
```

## SDK API
```swift
/// MARK: - Configures the SDK
public func configure(apiKey: String, region: String? = **nil**)
```

## Events Tracking
At present, the SDK is capable of tracking the following events:

### App Events
* `opened` - This event is triggered when the app is launched.
* `closed` - This event is triggered when the app is closed.
* `foreground` - This event is triggered when the app is brought to the foreground, recorded as **put_in_foreground** in the logs.
* `background` - This event is triggered when the app is sent to the background, recorded as **put_in_background** in the logs.

### Screen Events
* `shown` - This event is triggered when a screen is displayed.
* `dismissed` - This event is triggered when a screen is dismissed.
