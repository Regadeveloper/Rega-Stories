// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "Network",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Network",
            targets: ["Network"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "Network",
            dependencies: [
                .product(name: "Domain", package: "Domain")
            ],
            resources: [
                .process("Resources")
            ]
        ),
    ]
)
