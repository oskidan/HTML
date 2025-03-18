// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "HTML",
    platforms: [.macOS(.v14)],
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
        .package(
            url: "https://github.com/oskidan/CSS.git",
            // The main branch will be used until initial release.
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "HTML",
            dependencies: [
                "CSS",
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
        .executableTarget(
            name: "HTMLDemo",
            dependencies: [
                "CSS",
                "HTML",
                "JavaScriptKit",
                .product(
                    name: "JavaScriptEventLoop",
                    package: "JavaScriptKit"
                ),
            ]
        )
    ]
)
