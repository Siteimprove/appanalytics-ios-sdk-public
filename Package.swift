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
            name: "SiteimproveAppAnalytics", url: "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/1.1.0/SiteimproveAppAnalytics.xcframework.zip", checksum: "0ded1f05747f218cacc8ecb7c6b0aabbc47dbaa8106074166086ca336fd7d959"
        )
    ]
)
