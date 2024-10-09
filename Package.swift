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
            name: "SiteimproveAppAnalytics", url: "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/1.0.0/SiteimproveAppAnalytics.xcframework.zip", checksum: "b8a33bdde479f8a6f01c13769f8ad429d0ce18f3490aedc427e0d28d3023a023"
        )
    ]
)