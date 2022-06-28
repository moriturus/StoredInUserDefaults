# StoredInUserDefaults

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

`StoredInUserDefaults` is a utility for `UserDefaults` with strong types and easiness.

## Dependencies

- [Default](https://github.com/moriturus/Default)
- [StoredIn](https://github.com/moriturus/StoredIn)
    - `StoredInUserDefaults` is built upon `StoredIn` as a base library.

## Installation

Please use the `Swift Package Manager`.

```swift
dependencies: [
    .package(url: "https://github.com/moriturus/StoredInUserDefaults.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage

```swift
import StoredInUserDefaults

struct AppSetting {
    // Use as the property wrapper.  
    // You should specify a key which is used in `UserDefaults`.
    @StoredInUserDefaults(key: "com.example.my-app.isAwesome")
    var isAwesome: Bool
}

var setting = AppSetting()

print(setting.isAwesome) // prints `false` which means the default value is `false`. 

setting.isAwesome = true

UserDefaults.standard.bool(forKey: "com.example.my-app.isAwesome") == setting.isAwesome // `true`

```

## License

This software is released under the MIT License.  
See LICENSE file for details.

