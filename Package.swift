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
        // Ваш бінарний таргет
        .binaryTarget(
            name: "ottu_checkout_sdk",  // Ім'я фреймворка для імпорту
            path: "Sources/ottu_checkout_sdk.xcframework"  // Шлях до xcframework
        ),
        
        // Таргет для основного фреймворка, де будуть підключатися залежності
        .target(
            name: "ottu_checkout_sdk",
            dependencies: [
                "SVGKit",  // Залежність SVGKit
                .product(name: "Sentry", package: "sentry-cocoa"),  // Залежність Sentry
                "ottu_checkout_sdk"  // Ваш бінарний фреймворк
            ]
        ),
    ]
)
