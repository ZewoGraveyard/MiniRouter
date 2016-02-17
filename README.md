MiniRouter
==========
[![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://swift.org)
[![Platform Linux](https://img.shields.io/badge/Platform-Linux-lightgray.svg?style=flat)](https://swift.org)
[![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://tldrlegal.com/license/mit-license)
[![Slack Status](https://zewo-slackin.herokuapp.com/badge.svg)](http://slack.zewo.io)

**MiniRouter** is small router for Zewo.

## Usage

```swift
import HTTPServer
import MiniRouter

get("/") { _
    return Response(body: "hello")
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
