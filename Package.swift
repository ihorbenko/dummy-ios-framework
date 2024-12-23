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
            targets: ["ottu_checkout_sdk"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.33.0"),
        .package(url: "https://github.com/SVGKit/SVGKit", from: "3.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "ottu_checkout_sdk_binary",
            path: "./BinaryFrameworks/ottu_checkout_sdk.xcframework"
        ),
        .target(
            name: "ottu_checkout_sdk",
            dependencies: [
                "ottu_checkout_sdk_binary",
                .product(name: "Sentry", package: "sentry-cocoa"),
                "SVGKit"
            ],
            path: "./Sources",
            linkerSettings: [
                .linkedFramework("ottu_checkout_sdk_binary", .when(platforms: [.iOS]))
            ]
        )
    ]
)
