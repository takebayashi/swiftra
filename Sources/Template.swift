/*
 The MIT License (MIT)

 Copyright (c) 2016 shiriyo

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
import Foundation
public class Template {
    static public func eswift(content: String) -> Response {
        // TODO: later change template ex.mustache
        let ext = "eswift"
        if let filePath = NSBundle.mainBundle().pathForResource(
            "../../views/\(String(content))", ofType: ext) {
            do {
                let data = try String(contentsOfFile: filePath,
                    encoding: NSUTF8StringEncoding)
                // for line in data.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) {
                    // Do something
                    // print(line)
                // }
                return Response(status: .OK,
                    headers: [("Content-Type", "text/html")], body: data)
            } catch {
                print("Couldn't load the file somehow")
                return Response(status: .OK,
                    headers: [("Content-Type", "text/html")],
                    body: "<h1>Couldn't load the file somehow!</h1>")
            }
        } else {
            print("\(String(content)).\(String(ext)) is missing")
            return Response(status: .OK,
                headers: [("Content-Type", "text/html")],
                body: "<h1>Missing!</h1>")
        }
    }
    // TODO:
    static public func json(content: String) -> Response {
        let data = ""
        return Response(status: .OK,
            headers: [("Content-Type", "text/html")], body: data)
    }
}
