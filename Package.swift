// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "HTML",
    products: [
        .library(
            name: "HTML",
            targets: [
                "HTML"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swiftwasm/carton", 
            exact: "1.1.3"
        ),
        .package(
            url: "https://github.com/swiftwasm/JavaScriptKit", 
            exact: "0.23.0"
        ),
    ],
    targets: [
        .target(
            name: "HTML",
            dependencies: [
                "JavaScriptKit"
            ]
        ),
        .testTarget(
            name: "HTMLTests",
            dependencies: [
                "HTML",
                "JavaScriptKit"
            ]
        ),
    ]
)
