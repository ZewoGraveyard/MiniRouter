// MiniRouter.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Zewo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

@_exported import RegexRouteMatcher

public var miniRouter = MiniRouter()

public final class MiniRouter: RouterType {
    public let middleware: [MiddlewareType] = []
    public var matcher: RouteMatcherType = RegexRouteMatcher(routes: [])
    public var fallback: ResponderType = Responder { _ in
        return Response(status: .NotFound)
    }
}

public var fallback: ResponderType {
    set {
        miniRouter.fallback = newValue
    }

    get {
        return miniRouter.fallback
    }
}

public func fallback(middleware: MiddlewareType..., respond: Respond) {
    miniRouter.fallback = middleware.intercept(Responder(respond: respond))
}

public func get(path: String, middleware: MiddlewareType..., respond: Respond) {
    _methods([.GET], path: path, middleware: middleware, respond: respond)
}

public func post(path: String, middleware: MiddlewareType..., respond: Respond) {
    _methods([.POST], path: path, middleware: middleware, respond: respond)
}

public func put(path: String, middleware: MiddlewareType..., respond: Respond) {
    _methods([.PUT], path: path, middleware: middleware, respond: respond)
}

public func patch(path: String, middleware: MiddlewareType..., respond: Respond) {
    _methods([.PATCH], path: path, middleware: middleware, respond: respond)
}

public func delete(path: String, middleware: MiddlewareType..., respond: Respond) {
    _methods([.DELETE], path: path, middleware: middleware, respond: respond)
}

public func methods(m: Set<Method>, path: String, middleware: MiddlewareType..., respond: Respond) {
    _methods(m, path: path, middleware: middleware, respond: respond)
}

func _methods(m: Set<Method>, path: String, middleware: [MiddlewareType], respond: Respond) {
    let route = Route(
        methods: m,
        path: path,
        middleware: middleware,
        responder: Responder(respond: respond)
    )
    miniRouter.matcher = RegexRouteMatcher(routes: miniRouter.matcher.routes + [route])
}