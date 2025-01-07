// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "ottu_checkout_sdk",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ottu_checkout_sdk",
            targets: ["ottu_checkout_sdk_wrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SVGKit/SVGKit.git", from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "ottu_checkout_sdk_wrapper",
            dependencies: [
                "SVGKit",
                "ottu_checkout_sdk"
            ],
            path: "./Sources",
            linkerSettings: [
                .linkedFramework("SVGKit")
            ]
        ),
        .binaryTarget(
            name: "ottu_checkout_sdk",
            path: "./ottu_checkout_sdk.xcframework"
        )
    ]
)
