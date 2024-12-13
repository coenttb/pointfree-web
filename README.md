# swift-web: A Modular Web Foundation in Swift

Welcome to **swift-web** - an updated fork of PointFree's [swift-web](https://github.com/pointfreeco/swift-web). It is a collection of focused modules designed to simplify and streamline web development in Swift. This repository provides reusable building blocks that can be integrated into any Swift-based server or web project.

Each module is crafted for a specific responsibility, ensuring clean architecture and maintainable code. If you're building with Vapor, SwiftNIO, or other Swift server-side frameworks, **swift-web** can help you handle common tasks elegantly.

---

## Features and Modules

swift-web is modular by design. Here's an overview of its core components:

### **AppSecret**
- Manages secure app secrets with ease.

### **BasicAuth**
- Provides utilities for handling HTTP Basic Authentication.

### **DatabaseHelpers**
- Simplifies interactions with your database through reusable helper functions.

### **DecodableRequest**
- Decodes incoming HTTP requests directly into Swift types using `Codable`.

### **EmailAddress**
- Defines a robust structure for handling and validating email addresses.

### **Favicon**
- Handles favicon generation and routing with minimal effort.

### **FoundationPrelude**
- Extends Foundation utilities, including support for HTTP client operations and URL requests.

### **HttpPipeline**
- Core HTTP pipeline utilities, including:
  - `Conn`: Connection handler.
  - `Method`: HTTP method definitions.
  - `Middleware`: Middleware utilities for request/response processing.
  - `Response`: Simplifies HTTP response creation.
  - `SignedCookies`: Utilities for working with signed cookies.
  - `Status`: HTTP status management.

### **LoggingDependencies**
- Implements lightweight logging utilities to integrate with your app's dependency system.

### **MediaType**
- Provides definitions and utilities for handling media types.

### **NioDependencies**
- Extensions for working seamlessly with SwiftNIO.

### **Sitemap**
- Tools for building and serving a sitemap for your website.

### **UrlFormCoding**
- Encodes and decodes URL-encoded forms for easy form handling.

### **UrlFormEncoding**
- Utilities for URL form decoding and encoding, tailored for modern web apps.

---

## Installation

To use **swift-web** in your project, add it to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-web.git", branch: "main")
]
```

---

## Feedback is Much Appreciated!
  
If you’re working on your own Swift web project, feel free to learn, fork, and contribute.

Got thoughts? Found something you love? Something you hate? Let me know! Your feedback helps make this project better for everyone. Open an issue or start a discussion—I’m all ears.

> tip: 👉 **[Subscribe to my newsletter](http://coenttb.com/en/newsletter/subscribe) **
>
> [Follow me on X](http://x.com/coenttb)
> 
> [Link on Linkedin](https://www.linkedin.com/in/tenthijeboonkkamp)

---

## License

swift-web is open-source software licensed under the Apache 2.0 License. See the [LICENSE](LICENSE).
