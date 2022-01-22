// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RedECS",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RedECS",
            targets: ["RedECS"]),
        .library(
            name: "RedECSBasicComponents",
            targets: ["RedECSBasicComponents"]
        ),
        .library(
            name: "RedECSRenderingComponents",
            targets: ["RedECSRenderingComponents"]
        ),
        .library(
            name: "RedECSExamples",
            targets: ["RedECSExamples"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../Geometry")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RedECS",
            dependencies: []
        ),
        .testTarget(
            name: "RedECSTests",
            dependencies: ["RedECS"]
        ),
        
        .target(
            name: "RedECSBasicComponents",
            dependencies: ["RedECS", "Geometry"]
        ),
        .target(
            name: "RedECSRenderingComponents",
            dependencies: [
                "RedECS",
                "RedECSBasicComponents",
                .product(
                    name: "GeometrySpriteKitExtensions",
                    package: "Geometry"
                )
            ]
        ),
        .target(
            name: "RedECSExamples",
            dependencies: ["RedECSRenderingComponents"]
        ),
    ]
)
