import PackageDescription

let package = Package(
  name: "SwiftConsoleProject",
  dependencies: [
    .Package(url: "https://github.com/m039/SwiftFooBarLibrary", majorVersion: 1, minor: 3)
  ]
)
