// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ottu_checkout_sdk",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "ottu_checkout_sdk",
            targets: ["ottu_checkout_sdk_wrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.33.0"),
        .package(url: "https://github.com/SVGKit/SVGKit", from: "3.0.0")
    ],
    targets: [
        // Обгортка, яка зв'язує залежності та binaryTarget
        .target(
            name: "ottu_checkout_sdk_wrapper",
            dependencies: [
                "SVGKit",
                .product(name: "Sentry", package: "sentry-cocoa"),
                "ottu_checkout_sdk"
            ],
            path: "Sources/Wrapper" // Створіть цю папку
        ),
        .binaryTarget(
            name: "ottu_checkout_sdk",
            path: "Sources/ottu_checkout_sdk.xcframework"
        )
    ]
)
