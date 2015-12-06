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

    public enum Status: Int {
        case Continue = 100
        case SwitchingProtocols = 101
        case OK = 200
        case Created = 201
        case Accepted = 202
        case NonAuthoritativeInformation = 203
        case NoContent = 204
        case ResetContent = 205
        case PartialContent = 206
        case MultipleChoices = 300
        case MovedPermanently = 301
        case Found = 302
        case SeeOther = 303
        case NotModified = 304
        case UseProxy = 305
        case TemporaryRedirect = 307
        case BadRequest = 400
        case Unauthorized = 401
        case PaymentRequired = 402
        case Forbidden = 403
        case NotFound = 404
        case MethodNotAllowed = 405
        case NotAcceptable = 406
        case ProxyAuthenticationRequired = 407
        case RequestTimeout = 408
        case Conflict = 409
        case Gone = 410
        case LengthRequired = 411
        case PreconditionFailed = 412
        case RequestEntityTooLarge = 413
        case RequestURITooLong = 414
        case UnsupportedMediaType = 415
        case RequestedRangeNotSatisfiable = 416
        case ExpectationFailed = 417
        case InternalServerError = 500
        case NotImplemented = 501
        case BadGateway = 502
        case ServiceUnavailable = 503
        case GatewayTimeout = 504
        case HTTPVersionNotSupported = 505
    }

    var status = Status.OK
    var headers = [String: String]()
    var body = ""

    public init(status: Status, headers: [String: String], body: String) {
        self.status = status
        self.headers = headers
        self.body = body
    }

    public init(_ content: String) {
        body = content
    }

    public init(_ status: Status) {
        self.status = status
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

extension Response.Status: CustomStringConvertible {

    public var description: String {
        switch self {
        case Continue:
            return "Continue"
        case SwitchingProtocols:
            return "Switching Protocols"
        case OK:
            return "OK"
        case Created:
            return "Created"
        case Accepted:
            return "Accepted"
        case NonAuthoritativeInformation:
            return "Non-Authoritative Information"
        case NoContent:
            return "No Content"
        case ResetContent:
            return "Reset Content"
        case PartialContent:
            return "Partial Content"
        case MultipleChoices:
            return "Multiple Choices"
        case MovedPermanently:
            return "Moved Permanently"
        case Found:
            return "Found"
        case SeeOther:
            return "See Other"
        case NotModified:
            return "Not Modified"
        case UseProxy:
            return "Use Proxy"
        case TemporaryRedirect:
            return "Temporary Redirect"
        case BadRequest:
            return "Bad Request"
        case Unauthorized:
            return "Unauthorized"
        case PaymentRequired:
            return "Payment Required"
        case Forbidden:
            return "Forbidden"
        case NotFound:
            return "Not Found"
        case MethodNotAllowed:
            return "Method Not Allowed"
        case NotAcceptable:
            return "Not Acceptable"
        case ProxyAuthenticationRequired:
            return "Proxy Authentication Required"
        case RequestTimeout:
            return "Request Timeout"
        case Conflict:
            return "Conflict"
        case Gone:
            return "Gone"
        case LengthRequired:
            return "Length Required"
        case PreconditionFailed:
            return "Precondition Failed"
        case RequestEntityTooLarge:
            return "Request Entity Too Large"
        case RequestURITooLong:
            return "Request-URI Too Long"
        case UnsupportedMediaType:
            return "Unsupported Media Type"
        case RequestedRangeNotSatisfiable:
            return "Requested Range Not Satisfiable"
        case ExpectationFailed:
            return "Expectation Failed"
        case InternalServerError:
            return "Internal Server Error"
        case NotImplemented:
            return "Not Implemented"
        case BadGateway:
            return "Bad Gateway"
        case ServiceUnavailable:
            return "Service Unavailable"
        case GatewayTimeout:
            return "Gateway Timeout"
        case HTTPVersionNotSupported:
            return "HTTP Version Not Supported"
        }
    }

}
