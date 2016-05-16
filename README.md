# Swiftra

Swiftra is a library that provides DSLs like Sinatra.

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

// template home.esiwft
get("/template") { req in
    return Template.eswift("home")
}

serve(8080)
```
