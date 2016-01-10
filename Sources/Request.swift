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

import struct http4swift.HTTPRequest

public protocol Request {

    var method: String { get }
    var path: String { get }
    var proto: String { get }
    var headers: [String: String] { get }
    var body: [CChar] { get }
    var bodyString: String { get }
    var parameters: [String: String] { get }

}

extension Request {

    public var bodyString: String {
        var buffer = body
        buffer.append(CChar(0))
        return String.fromCString(buffer) ?? ""
    }

}

struct RawRequest: Request {

    let underlying: HTTPRequest

    init(underlying: HTTPRequest) {
        self.underlying = underlying
    }

    var method: String {
        return underlying.method
    }

    var path: String {
        return underlying.path
    }

    var proto: String {
        return underlying.proto
    }

    var headers: [String: String] {
        return underlying.headers
    }

    var body: [CChar] {
        return underlying.body
    }

    var parameters: [String: String] {
        // TODO: return from URI query or body parameters
        return [String: String]()
    }

}

struct ParameterizedRequest: Request {

    let underlying: Request

    let params: [String: String]

    init(underlying: Request, parameters: [String: String]) {
        self.underlying = underlying
        self.params = parameters
    }

    var method: String {
        return underlying.method
    }

    var path: String {
        return underlying.path
    }

    var proto: String {
        return underlying.proto
    }

    var headers: [String: String] {
        return underlying.headers
    }

    var body: [CChar] {
        return underlying.body
    }

    var parameters: [String: String] {
        get {
            var fields = underlying.parameters
            self.parameters.forEach { (key, value) in
                fields.updateValue(value, forKey: key)
            }
            return fields
        }
    }

}
