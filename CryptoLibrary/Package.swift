// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let targets: [Target] = [
    .target(
        name: "AssetDetailsFeature",
        dependencies: [
            "Charts",
            "ClientNetworkService",
            "Components",
            "Models",
            "Module",
            "RxSwift",
            "WebViewFeature"
        ]
    ),
    .target(
        name: "AssetListFeature",
        dependencies: [
            "AssetDetailsFeature",
            "ClientNetworkService",
            "Components",
            "Models",
            "Module",
            "RxSwift"
        ]
    ),
    .target(
        name: "Charts",
        dependencies: ["Components"],
        resources: [.process("Resources")],
        cSettings: [.define("GLES_SILENCE_DEPRECATION")]
    ),
    .target(
        name: "ClientNetworkService",
        dependencies: [
            "RxSwift",
            "Models",
            "NetworkService"
        ]
    ),
    .target(
        name: "Components",
        dependencies: [
            "RxSwift",
            .product(name: "RxCocoa", package: "RxSwift"),
            "Models"
        ]
    ),
    .target(
        name: "Models",
        dependencies: ["RxSwift"]
    ),
    .target(
        name: "Module",
        dependencies: ["RxSwift"]
    ),
    .target(
        name: "NetworkService",
        dependencies: ["RxSwift"]
    ),
    .target(
        name: "RootFeature",
        dependencies: [
            "AssetListFeature",
            "Components",
            "NetworkService",
            "RxSwift",
            "Models",
            "Module",
            "ClientNetworkService"
        ]
    ),
    .target(
        name: "WebViewFeature",
        dependencies: [
            "Module"
        ]
    )
]

let package = Package(
    name: "CryptoLibrary",
    platforms: [.iOS(.v13)],
    products: targets
        .map { .library(name: $0.name, targets: [$0.name]) },
    dependencies: [
        .package(
            url: "https://github.com/ReactiveX/RxSwift.git",
            .exact("6.5.0")
        )
    ],
    targets: targets
)
