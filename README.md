MiniRouter
==========
[![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://swift.org)
[![Platform Linux](https://img.shields.io/badge/Platform-Linux-lightgray.svg?style=flat)](https://swift.org)
[![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://tldrlegal.com/license/mit-license)
[![Slack Status](https://zewo-slackin.herokuapp.com/badge.svg)](http://slack.zewo.io)

**MiniRouter** is a small router for Zewo. It should be used for really small web apps. If you plan to create a full-fledged web app you should use [Router](https://github.com/Zewo/Router). [Router](https://github.com/Zewo/Router) has a lot more features and is much more flexible.

## Usage

```swift
import HTTPServer
import MiniRouter

get("/users") { _ in
    return Response(body: "all users")
}

post("/users") { _ in
    return Response(body: "created user")
}

get("/users/:id") { request in
    let id = request.pathParameters["id"]!
    return Response(body: "got user \(id)")
}

put("/users/:id") { request in
    let id = request.pathParameters["id"]!
    return Response(body: "updated user \(id)")
}

delete("/users/:id") { request in
    let id = request.pathParameters["id"]!
    return Response(body: "deleted user \(id)")
}

try Server(responder: miniRouter).start()
```

## Installation

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/Zewo/MiniRouter.git", majorVersion: 0, minor: 2)
    ]
)
```

## Community

[![Slack](http://s13.postimg.org/ybwy92ktf/Slack.png)](http://slack.zewo.io)

Join us on [Slack](http://slack.zewo.io).

License
-------

**MiniRouter** is released under the MIT license. See LICENSE for details.
