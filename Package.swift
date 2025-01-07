// swift-tools-version:5.6
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
    targets: [
        .binaryTarget(
            name: "ottu_checkout_sdk"
        )
    ]
)
