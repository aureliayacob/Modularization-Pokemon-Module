// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pokemon",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Pokemon",
            targets: ["Pokemon"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
//        .package(name: "Alamofire" url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.5.0"))
        //.package(url: "https://gitlab.com/ajinumoto/game-watcher-core.git", .branchItem("main")),
        .package(url: "https://github.com/aureliayacob/Bulbapedia-Core-Package.git", branch: "main")
    ],
    targets: [
        .target(
            name: "Pokemon",
            dependencies: [.product(name: "Core", package: "Bulbapedia-Core-Package")]),
        .testTarget(
            name: "PokemonTests",
            dependencies: ["Pokemon"]),
    ]
)
