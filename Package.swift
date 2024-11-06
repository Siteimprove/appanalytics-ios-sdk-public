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
            name: "SiteimproveAppAnalytics", url: "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/1.1.0/SiteimproveAppAnalytics.xcframework.zip", checksum: "9edc7ae50ea0962552606533b8b05b134d5b9af96cb6825fd3bd3ee12abd58c6"
        )
    ]
)