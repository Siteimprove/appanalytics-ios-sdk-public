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
The XCFramework can be downloaded from our [release page](https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases). After unzipping, place the XCFramework in the Framework Search Paths of your Xcode project, import it into the project, and configure it to `Embed & Sign`.

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
public func trackCustomEvent(k: String, a: [String : String])
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

### Custom Events

* `search` - Track search events by providing query, isSuccessful as well as numberOfResults
* `custom` - Track custom events by providing k as the key of the event as well as attributes associated with the event specified as a set of key/value pairs.

## Usage Examples

*1. Tracking search event*

To track a search event, use the **trackSearchEvent** method when a user performs a search. This could be in the search bar’s action or on a search results page.

```swift
func performSearch(query: String) {

    // Filtering a list of results based on the query
    let filteredComponents = performFiltering(for: query)
    Siteimprove.shared.trackSearchEvent(query: query,
                                        isSuccessful: !filteredComponents.isEmpty,
                                        numberOfResults: filteredComponents.count)
}
```
- Parameters:

    - **query:** The search query entered by the user.

    - **isSuccessful:** A Bool indicating if results were found.

    - **numberOfResults:** An Int representing the number of results found.
    
    
*2. Tracking custom event*

Use **trackCustomEvent** to track custom user actions in the app, such as refreshing the cart, completing a checkout, or any other custom user interaction.

```swift
func refreshCart() {
    Siteimprove.shared.trackCustomEvent(k: "cart.refresh",
                                        a: [
                                            "guest": "true",
                                            "currency": "USD",
                                            "cart.item_count": "10",
                                            "cart.value": "249.99"
                                        ])
}
```
- Parameters:

    - **k:** The event key describing the type of event ("cart.refresh" in this example).
    - **a:** A dictionary of key-value pairs detailing attributes of the event. Here, we’re providing cart details like item count and value.
    
**Note:** When using the trackCustomEvent method, it is crucial to ensure the uniqueness of the keys in the attributes dictionary. Duplicate keys are not recommended. If duplication occurs, the first instance of the key-value pair will be prioritised, and subsequent duplicates will be ignored. Please take care to avoid key duplication to ensure accurate event tracking.

