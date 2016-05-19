/*
 The MIT License (MIT)

 Copyright (c) 2015 Shun Takebayashi

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
*/

import Nest
import struct http4swift.HTTPServer
import struct http4swift.SocketAddress
import struct http4swift.Socket

public func get(path: String, handler: Handler) {
    Router.sharedRouter.addPattern(method: "GET", pattern: path, handler: handler)
}

public func post(path: String, handler: Handler) {
    Router.sharedRouter.addPattern(method: "POST", pattern: path, handler: handler)
}

public func put(path: String, handler: Handler) {
    Router.sharedRouter.addPattern(method: "PUT", pattern: path, handler: handler)
}

public func delete(path: String, handler: Handler) {
    Router.sharedRouter.addPattern(method: "DELETE", pattern: path, handler: handler)
}

public func head(path: String, handler: Handler) {
    Router.sharedRouter.addPattern(method: "HEAD", pattern: path, handler: handler)
}

public func serve(port: UInt16) {
    let stringValue = "access : http://localhost:\(port)"
    print(stringValue)
    let addr = SocketAddress(port: port)
    guard let sock = Socket() else {
        return
    }
    guard let server = HTTPServer(socket: sock, addr: addr) else {
        return
    }

    server.serve { (request) -> ResponseType in
        var response: Response? = Router.sharedRouter.dispatch(RawRequest(underlying: request))
        if response == nil {
            response = Response(.NotFound)
            response!.bodyBytes = Response.Status.NotFound.description.bytes()
        }
        print(request.method)
        return response!
    }
}
