# Swiftra: Sinatra-like DSL in Swift

## Example

See [swiftra-example](https://github.com/takebayashi/swiftra-example).

```swift
import swiftra

get("/hello") { req in
    return "Hello, World!"
}

post("/404") { req in
    return Response(status: 404, headers: ["Content-Type": "text/plain"], body: "The page you requested was not found")
}

serve(8080)
```
