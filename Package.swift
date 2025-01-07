// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "dummy-ios-framework",
    platforms: [
          .iOS(.v13)
      ],
    products: [
        .library(
            name: "dummy-ios-framework",
            targets: ["dummy-ios-framework"]),
    ],
    dependencies: [
           .package(url: "https://github.com/SVGKit/SWGKit.git", from: "3.0.0"),
       ],
    targets: [
        .binaryTarget(
              name: "ottu_checkout_sdk",
              path: "./Sources/ottu_checkout_sdk.xcframework"),
        .target(
            name: "dummy-ios-framework",
            dependencies: [
                           .product(name: "SWGKit", package: "SWGKit")
                       ]
        ),

    ]
)
