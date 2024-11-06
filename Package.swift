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
            name: "SiteimproveAppAnalytics", url: "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/1.1.0/SiteimproveAppAnalytics.xcframework.zip", checksum: "6b7322e2741b7ee06d377518fe4274a509e3c6048c1b93efa63e1515838b4ce0"
        )
    ]
)