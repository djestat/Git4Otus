// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ServicesLayer",
    platforms: [
        .iOS(.v16)
    ],
    
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ServicesLayer",
            targets: ["ServicesLayer"]),
    ],
    dependencies: [
        .package(name: "AppCore", path: "../AppCore"),
        .package(name: "Networking", path: "../Networking"),
        .package(name: "DataStorage", path: "../DataStorage")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ServicesLayer",
            dependencies: [
                .product(name: "AppCore", package: "AppCore"),
                .product(name: "Networking", package: "Networking"),
                .product(name: "DataStorage", package: "DataStorage")
            ]
        ),
    ]
)
