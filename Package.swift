import PackageDescription

let package = Package(
    name: "swiftra",
    dependencies: [
        .Package(url: "https://github.com/nestproject/Nest.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/takebayashi/http4swift.git", majorVersion: 0, minor: 2)
    ]
)
