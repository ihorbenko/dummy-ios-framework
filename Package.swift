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
        )
    ],
    dependencies: [
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.33.0"),
        .package(url: "https://github.com/SVGKit/SVGKit", branch: "3.x")
    ],
    targets: [
        .target(
            name: "ottu_checkout_sdk",
            dependencies: [
                         "SVGKit",
                         .product(name: "Sentry", package: "sentry-cocoa")
                     ],
            cSettings: [
                .headerSearchPath("External/SVGKit/privateHeaders")
            ],
            linkerSettings: [
                .linkedLibrary("SVGKit")
            ]
        )
    ]
)
