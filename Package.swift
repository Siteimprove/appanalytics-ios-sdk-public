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
            name: "SiteimproveAppAnalytics", url: "https://github.com/Siteimprove/appanalytics-ios-sdk-public/releases/download/1.2.0/SiteimproveAppAnalytics.xcframework.zip", checksum: "c1bb83e2591ddf270f575a159302e47ed15f8feb288d290d1687d9a2f65cee20"
        )
    ]
)
