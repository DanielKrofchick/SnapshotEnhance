// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnapshotEnhance",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/koher/swift-image", from: "0.8.0"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "SnapshotEnhance",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "SwiftImage", package: "swift-image"),
                .product(name: "PathKit", package: "PathKit")
            ]
        )
    ]
)
