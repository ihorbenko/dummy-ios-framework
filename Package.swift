// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ottu_checkout_sdk",
    platforms: [
        .iOS(.v15)  // Вкажіть мінімальну версію iOS
    ],
    products: [
        // Додаємо основну бібліотеку з правильним ім'ям для імпорту
        .library(
            name: "ottu_checkout_sdk",  // Це ім'я, яке ви хочете використовувати при імпорті
            targets: ["ottu_checkout_sdk"]  // Таргет для фреймворка
        ),
    ],
    dependencies: [
        // Додавання залежностей
        .package(url: "https://github.com/ihorbenko/dummy-ios-framework", from: "1.0.0"),
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.33.0"),
        .package(url: "https://github.com/SVGKit/SVGKit", from: "3.0.0")
    ],
    targets: [
        // Ваш бінарний таргет (з правильним шляхом до xcframework)
        .binaryTarget(
            name: "ottu_checkout_sdk",  // Ім'я фреймворка для імпорту
            path: "Sources/ottu_checkout_sdk.xcframework"  // Шлях до xcframework
        ),
        
        // Таргет для обгортки, щоб додавати залежності (SVGKit, Sentry)
        .target(
            name: "ottu_checkout_sdk_wrapper",
            dependencies: [
                "SVGKit",  // Додано залежність SVGKit
                .product(name: "Sentry", package: "sentry-cocoa"),  // Додано залежність Sentry
                "ottu_checkout_sdk"  // Підключаємо бінарний фреймворк
            ]
        ),
    ]
)
