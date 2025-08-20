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
            name: "SiteimproveAppAnalytics", url: "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/1.2.1/SiteimproveAppAnalytics.xcframework.zip", checksum: "e111f12c1798a28920ca5712345bd9eb8f446efac2bdba5fcc3cf7ca1f6a6fd3"
        )
    ]
)
