// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SiteimproveAppAnalytics",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SiteimproveAppAnalytics",
            targets: ["SiteimproveAppAnalytics"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SiteimproveAppAnalytics", url: "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/1.2.0/SiteimproveAppAnalytics.xcframework.zip", checksum: "8eca7bd88e0cb3dd116c794e94423895b41f4bd53e8655083d0a8b53306422b9"
        )
    ]
)
