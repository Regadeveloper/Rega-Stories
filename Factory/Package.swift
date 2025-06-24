// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "Factory",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Factory",
            targets: ["Factory"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Network"),
        .package(path: "../Home")
    ],
    targets: [
        .target(
            name: "Factory",
            dependencies: [
                "Domain",
                "Network",
                "Home"
            ]
        ),
    ]
)
