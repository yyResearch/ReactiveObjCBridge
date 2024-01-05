// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReactiveObjCBridge",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ReactiveObjCBridge",
            targets: ["ReactiveObjCBridge", "ReactiveObjCBridge_Swift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/yyResearch/ReactiveObjC.git", .branch("SPM-fix")),
        .package(url: "https://github.com/yyResearch/ReactiveSwift.git", from: "6.6.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ReactiveObjCBridge",
            dependencies: ["ReactiveObjC", "ReactiveSwift"],
            path: "ReactiveObjCBridge",
            publicHeadersPath: "include"
        ),
        .target(
            name: "ReactiveObjCBridge_Swift",
            dependencies: ["ReactiveObjC", "ReactiveSwift", "ReactiveObjCBridge"],
            path: "ReactiveObjCBridge_Swift"
        )
    ],
    swiftLanguageVersions: [.v5]
)
