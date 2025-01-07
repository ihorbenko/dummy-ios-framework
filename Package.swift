// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ottu_checkout_sdk",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ottu_checkout_sdk",
            targets: ["ottu_checkout_sdk", "ottu_checkout_sdk_binary"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.33.0"),
        .package(url: "https://github.com/SVGKit/SVGKit", branch: "3.x")
    ],
    targets: [
        .package(name: "ottu_checkout_sdk_binary", path: "./Sources/ottu_checkout_sdk.xcframework")
        .target(
            name: "ottu_checkout_sdk",
            dependencies: [
                         "SVGKit",
                         .product(name: "Sentry", package: "sentry-cocoa")
                     ],
        )
    ]
)
