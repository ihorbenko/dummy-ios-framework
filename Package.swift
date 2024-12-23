import PackageDescription

let package = Package(
    name: "ottu_checkout_sdk",
  
    products: [
            .library(name: "ottu_checkout_sdk", targets: ["ottu_checkout_sdk"])
    ],

    dependencies: [
            .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.33.0"),
            .package(url: "https://github.com/SVGKit/SVGKit", branch: "3.x")
    ],
    
    targets: [
             .binaryTarget(name: "ottu_checkout_sdk", path: "Sources/ottu_checkout_sdk.xcframework")
    ]
)
