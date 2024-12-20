// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ottu_checkout_sdk",
    platforms: [
        .iOS(.v11) // Specify the minimum iOS version; adjust as necessary
    ],
    products: [
        .library(
            name: "ottu_checkout_sdk",
            targets: ["ottu_checkout_sdk"]
        )
    ],
    dependencies: [
        // Sentry dependency
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.33.0"),
        // SVGKit dependency
        .package(url: "https://github.com/SVGKit/SVGKit", from: "3.0.0")
    ],
    targets: [
        // Declare the binary target
        .binaryTarget(
            name: "ottu_checkout_sdk",
            path: "Sources/ottu_checkout_sdk.xcframework"
        ),
        // Example target that might depend on Sentry and SVGKit
        // Add more targets if required in your project
        .target(
            name: "ExampleTarget",
            dependencies: [
                .product(name: "Sentry", package: "sentry-cocoa"),
                "SVGKit"
            ],
            path: "Sources/ExampleTarget" // Replace with your target's source path
        )
    ]
)

