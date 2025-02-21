# AppAnalytics iOS SDK

## Contents

- [Requirements](#requirements)
- [Configuring the SDK](#configuring-the-sdk)
- [SDK API](#sdk-api)
- [Events Tracking](#events-tracking)

## Requirements
The minimum deployment target is iOS 15.

## Installation
You can install the Siteimprove SDK using the Swift Package Manager, CocoaPods or by manually downloading and adding it to your project.

### Swift Package Manager (preferred)
In Xcode, add a package dependency to your project using the following URL:  
```swift
https://github.com/Siteimprove/appanalytics-ios-sdk-public
```
### Cocoapods

In your Podfile, add the following line:
```
pod 'SiteimproveAppAnalytics', :git => 'https://github.com/Siteimprove/appanalytics-ios-sdk-public', :tag => '1.2.0'
```

### Manual
The XCFramework can be downloaded from our [release page](https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases). After unzipping, place the XCFramework in the Framework Search Paths of your Xcode project, import it into the project, and configure it to `Embed & Sign`.

## Configuring the SDK
Our suggestion for configuring the Siteimprove AppAnalytics is to do so in the AppDelegate.
You must provide an API key as well as region - Region1 or Region2. Information about API key and region can be found within the Siteimprove platform

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
- Configure the SDK

```swift
public func configure(apiKey: String, region: String)
```

- Track search event
```swift
public func trackSearchEvent(query: String, isSuccessful: Bool, numberOfResults: Int)
```

- Track custom event
```swift
public func trackCustomEvent(key: String, attributes: [String : String])
```

- Track screen event **manually**
```swift
public func trackScreenEvent(state: String, name: String, navTitle: String)
```

- Track push notification event
```swift
public func trackNotificationEvent(uid: String, state: String, key: String)
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

##### Swift
To enable the screen tracking functionality of the SDK within SwiftUI views, developers are required to utilize an additional modifier named tagScreen. This modifier is responsible for conveying crucial metadata pertaining to the currently displayed screen.

- Parameters:
    - **screenName:** A string that represents the unique identifier of the screen.
    - **navTitle**(optional): A string that represents the navigation title of the screen.

Here's an example of how to use the tagScreen modifier in a SwiftUI view:
```swift
import SwiftUI
import SiteimproveAppAnalytics

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World")
        }
        .tagScreen("Home", "Home Navigation")
    }
}
```

##### Hybrid
Due to the difference between native & hybrid, developers that are using hybrid technologies such as react-native are required to utilize an additional method named trackScreenEvent.

- Parameters:
    - **state:** A string that represents the screen state - shown or dismissed.
    - **name:** A string that represents the screen name.
    - **navTitle:** A string that represents the navigation title of the screen.

*For full documentation related to react-native setup follow the link [**here**](https://github.com/Siteimprove/appanalytics-react-native-bridge)*

### Custom Events

* `search` - Track search events by providing query, isSuccessful as well as numberOfResults.
* `custom` - Track custom events by providing k as the key of the event as well as attributes associated with the event specified as a set of key/value pairs.
* `notification` - Track push notification events by providing uid as unique identifier, state of the notification as well as key associated with the event.

1. Tracking search event

To track a search event, use the **trackSearchEvent** method when a user performs a search. This could be in the search bar’s action or on a search results page.

- Parameters:
    - **query:** The search query entered by the user.
    - **isSuccessful:** A Bool indicating if results were found.
    - **numberOfResults:** An Int representing the number of results found.

```swift
func performSearch(query: String) {

    // Filtering a list of results based on the query
    let filteredComponents = performFiltering(for: query)
    Siteimprove.shared.trackSearchEvent(query: query,
                                        isSuccessful: !filteredComponents.isEmpty,
                                        numberOfResults: filteredComponents.count)
}
```
    
2. Tracking custom event

Use **trackCustomEvent** to track custom user actions in the app, such as refreshing the cart, completing a checkout, or any other custom user interaction.

- Parameters:
    - **key:** The event key describing the type of event ("cart.refresh" in this example).
    - **attributes:** A dictionary of key-value pairs detailing attributes of the event. Here, we’re providing cart details like item count and value.

```swift
func refreshCart() {
    Siteimprove.shared.trackCustomEvent(key: "cart.refresh",
                                        attributes: [
                                            "guest": "true",
                                            "currency": "USD",
                                            "cart.item_count": "10",
                                            "cart.value": "249.99"
                                        ])
}
```
**Note:** When using the trackCustomEvent method, it is crucial to ensure the uniqueness of the keys in the attributes dictionary. Duplicate keys are not recommended. If duplication occurs, the first instance of the key-value pair will be prioritised, and subsequent duplicates will be ignored. Please take care to avoid key duplication to ensure accurate event tracking.

3. Tracking push notifications event
Use **trackNotificationEvent** to track push notifications events

- Parameters:
    - **uid:** A string that represents unique identifier for the notification
    - **state:** A string that represents the state of the notification - received or opened
    - **key:** A string that represents the key of the notification

**Note:** When using the trackNotificationEvent method, it is crucial to ensure the uniqueness of the uids passed as parameter.

*Notification received:*
```swift
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        Siteimprove.trackNotificationEvent(uid: uniqueId, state: "received", key: "some key")
        completionHandler([.banner, .sound, .badge])
    }
```

*Notification opened:*
```swift
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        Siteimprove.trackNotificationEvent(uid: uniqueId state: "opened", key: "some key")
        completionHandler()
    }
```

