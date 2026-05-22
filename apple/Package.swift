// swift-tools-version: 5.9

import PackageDescription

// The Mobile.xcframework must be built before resolving this package.
// Generate it via: apple/Scripts/build-xcframework.sh
let package = Package(
    name: "SlipstreamApple",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(name: "SlipstreamKit", targets: ["SlipstreamKit"]),
    ],
    targets: [
        .binaryTarget(
            name: "Mobile",
            path: "Frameworks/Mobile.xcframework"
        ),
        .target(
            name: "SlipstreamKit",
            dependencies: [
                .target(name: "Mobile", condition: .when(platforms: [.iOS])),
            ],
            resources: [
                .process("Resources"),
            ]
        ),
        .testTarget(
            name: "SlipstreamKitTests",
            dependencies: ["SlipstreamKit"]
        ),
    ]
)
