// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CryptoLibrary",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Charts",
            targets: ["Charts"]
        ),
        .library(
            name: "ClientNetworkService",
            targets: ["ClientNetworkService"]
        ),
        .library(
            name: "Components",
            targets: ["Components"]
        ),
        .library(
            name: "Models",
            targets: ["Models"]
        ),
        .library(
            name: "Module",
            targets: ["Module"]
        ),
        .library(
            name: "NetworkService",
            targets: ["NetworkService"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/ReactiveX/RxSwift.git",
            .exact("6.5.0")
        )
    ],
    targets: [
        .target(
            name: "Charts",
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
        )
    ]
)
