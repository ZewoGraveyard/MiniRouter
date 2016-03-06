import PackageDescription

let package = Package(
    name: "MiniRouter",
    dependencies: [
        .Package(url: "https://github.com/Zewo/RegexRouteMatcher.git", majorVersion: 0, minor: 3),
        .Package(url: "https://github.com/Zewo/CURIParser.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/Zewo/CHTTPParser.git", majorVersion: 0, minor: 2)
    ]
)
