// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StoredInUserDefaults",
    products: [
        .library(
            name: "StoredInUserDefaults",
            targets: ["StoredInUserDefaults"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/moriturus/StoredIn.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/moriturus/Default.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "StoredInUserDefaults",
            dependencies: ["StoredIn", "Default"]
        ),
        .testTarget(
            name: "StoredInUserDefaultsTests",
            dependencies: ["StoredInUserDefaults"]
        ),
    ]
)
