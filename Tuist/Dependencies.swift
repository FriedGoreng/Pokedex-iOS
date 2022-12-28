import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .package(path: "./LocalLibraries/Loadable"),
        .package(path: "./LocalLibraries/PokemonTypes"),
        .package(path: "./LocalLibraries/Requests"),
        .package(path: "./LocalLibraries/RequestsLive")
    ],
    platforms: [.iOS]
)
