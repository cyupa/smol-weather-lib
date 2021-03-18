// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "smol-weather-lib",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "smol-weather-lib",
            targets: ["smol-weather-lib"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "smol-weather-lib",
            dependencies: []),
        .testTarget(
            name: "smol-weather-lib-tests",
            dependencies: ["smol-weather-lib"]),
    ]
)
