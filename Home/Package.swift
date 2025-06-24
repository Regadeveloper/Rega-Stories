// swift-tools-version: 5.10
// La versión de las herramientas de Swift puede ser más reciente, como 6.0, si lo necesitas.
// He usado 5.10 por compatibilidad, ajústala si es necesario.

import PackageDescription

let package = Package(
    name: "Home",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]),
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                "Domain"
            ]
        ),
    ]
)
