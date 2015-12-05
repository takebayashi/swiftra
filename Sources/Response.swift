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

public struct Response {

    var status = 200
    var headers = [String: String]()
    var body = ""

    public init(status: Int, headers: [String: String], body: String) {
        self.status = status
        self.headers = headers
        self.body = body
    }

    public init(_ content: String) {
        body = content
    }

    var statusMessage: String {
        switch status {
        case 200:
            return "OK"
        case 404:
            return "Not Found"
        default:
            return ""
        }
    }

}

extension Response {

    static func notFound() -> Response {
        return Response(status: 404, headers: ["Content-Type": "text/plain"], body: "Not Found")
    }

}

public protocol ResponseSource {

    func response() -> Response

}

extension Response: ResponseSource {

    public func response() -> Response {
        return self
    }

}

extension String: ResponseSource {

    public func response() -> Response {
        return Response(self)
    }

}
