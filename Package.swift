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
            targets: ["ottu_checkout_sdk", "ottu_checkout_sdk_dep"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.33.0"),
        .package(url: "https://github.com/SVGKit/SVGKit", from: "3.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "ottu_checkout_sdk",
            path: "./Sources/ottu_checkout_sdk.xcframework"
        ),
        .target(
            name: "ottu_checkout_sdk_dep",
            dependencies: [
                         "SVGKit",
                         .product(name: "Sentry", package: "sentry-cocoa")
                     ],
            linkerSettings: [
                           .linkedLibrary("SVGKit")
                       ]
        )
    ]
)
