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
            name: "SiteimproveAppAnalytics", url: "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/1.0.0/SiteimproveAppAnalytics.xcframework.zip", checksum: "245b4d7b82cf94ad0617eab75a1dbf1fe76076ef3520d336c2bbee1007aeda65"
        )
    ]
)