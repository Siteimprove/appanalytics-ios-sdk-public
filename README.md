# Siteimprove App Analytics

## Contents

- [Requirements](#requirements)
- [Configuring the SDK](#configuring-the-sdk)
- [SDK API](#sdk-api)
- [Events Tracking](#events-tracking)

## Requirements
The minimum deployment target is iOS 15 

## Installation
The Siteimprove  SDK can be installed using Swift package manager or by manually downloading and adding it to the project.

### Swift package manager (preferred)
In Xcode add a package dependency to your project with the following URL: `"Add URL to the public repository"`

### Manual
The XCFramework can be downloaded from our [release page](add link to the release page of the SDK). The unzipped XCFramework needs to be placed on the Framework searchpath of your Xcode project, and imported into the project, then configured to `Embed and sign`.a

## Configuring the SDK
Our suggestion for configuring the Siteimprove AppAnalytics is to do so in the AppDelegate.
You must provide and api-key as well as region:
- r1 - EU
- r2 - US

The following is an example of how it could be done:

```swift
import SiteimproveAppAnalytics

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:                 [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Siteimprove.shared.configure(apiKey: "Your-API-Key", region: "r1")
        return true
    }
}
```

## SDK API
```swift
/// MARK: - Configures the SDK
public func configure(apiKey: String, region: String? = **nil**)

/// MARK: - Tracks a custom event
public func trackEvent(name: String, data: [String: **Any**])
```

## Events Tracking
At present, the SDK is capable of tracking the following events:

### App Events
* `opened` - This event is triggered when the app is launched.
* `closed` - This event is logged when the app is closed.
* `foreground` - This event fires when the app is brought to the foreground, listed as **put_in_foreground** in the logs.
* `background` - This event is activated when the app is sent to the background, recorded as **put_in_background** in the logs.

### Screen Events
* `shown` - This event is tracked when a screen is displayed.
* `dismissed` - This event is logged when a screen is dismissed.
