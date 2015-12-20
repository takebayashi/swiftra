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

public struct ContentType {

    let mediaType: String
    let parameters: [String: String]

    init(mediaType: String = "text/plain", parameters: [String: String] = [:]) {
        self.mediaType = mediaType
        self.parameters = parameters
    }

}

extension Request {

    public var contentType: ContentType {
        if let type = headers["Content-Type"] {
            var chunks = type.characters.split(";")
            let mediaType = String(chunks.removeFirst())
            var params = [String: String]()
            chunks.filter { s in return s.contains("=") }.forEach { chunk in
                let kv = chunk.split("=", maxSplit: 1, allowEmptySlices: true)
                params[String(kv[0])] = String(kv[1])
            }
            return ContentType(mediaType: mediaType, parameters: params)
        }
        return ContentType()
    }

}
