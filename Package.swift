// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "UCVisualDemoKit",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "UCVisualDemoKit", type: .dynamic, targets: ["UCVisualDemoKit"])
    ],
    targets: [
        .target(name: "UCVisualDemoKit", path: "Sources/UCVisualDemoKit")
    ]
)
