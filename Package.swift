// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ottu_checkout_sdk",
    platforms: [
        .iOS(.v15)  // Вкажіть мінімальну версію iOS
    ],
    products: [
        // Основний продукт, який буде імпортуватися як ottu_checkout_sdk
        .library(
            name: "ottu_checkout_sdk",  // Це ім'я, яке ви хочете використовувати при імпорті
            targets: ["ottu_checkout_sdk"]  // Таргет для вашого основного фреймворка
        ),
    ],
    dependencies: [
        // Залежності (SVGKit та Sentry)
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.33.0"),
        .package(url: "https://github.com/SVGKit/SVGKit", from: "3.0.0")
    ],
    targets: [
        // Таргет для основного фреймворка з усіма залежностями
        .target(
            name: "ottu_checkout_sdk",  // Це ім'я фреймворка для імпорту
            dependencies: [
                "SVGKit",  // Залежність SVGKit
                .product(name: "Sentry", package: "sentry-cocoa"),  // Залежність Sentry
                .binaryTarget(
                    name: "ottu_checkout_sdk_binary",  // Бінарний таргет
                    path: "Sources/ottu_checkout_sdk.xcframework"  // Шлях до xcframework
                )  // Ваш бінарний фреймворк
            ]
        ),
    ]
)
