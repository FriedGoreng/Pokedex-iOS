// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Loadable",
    products: [
        .library(
            name: "Loadable",
            targets: ["Loadable"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Loadable",
            dependencies: []),
        .testTarget(
            name: "LoadableTests",
            dependencies: ["Loadable"]),
    ]
)
