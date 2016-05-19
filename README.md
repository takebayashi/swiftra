# Swiftra

Swiftra is a library that provides DSLs like Sinatra.

## System Requirements

DEVELOPMENT-SNAPSHOT-2016-02-08-a

## Example

See [swiftra-example](https://github.com/takebayashi/swiftra-example).

```swift
import swiftra

get("/hello") { req in
    return "Hello, world!"
}

post("/form") { req in
    return "Hello: \(req.bodyString)"
}

get("/404") { req in
    return Response(.NotFound)
}

serve(8080)
```
