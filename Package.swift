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
            name: "SiteimproveAppAnalytics", url: "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/1.0.0/SiteimproveAppAnalytics.xcframework.zip", checksum: "97eca5a0c754d8f2af80e87c1ade0173fe5de607fc349cb3eba2e01b2866df92"
        )
    ]
)