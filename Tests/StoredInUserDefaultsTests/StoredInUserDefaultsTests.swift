// Copyright (c) 2022 Henrique Sasaki Yuya
// This software is released under the MIT License.
// See LICENSE file for details.

@testable import StoredInUserDefaults
import XCTest

final class StoredInUserDefaultsTests: XCTestCase {
    override func tearDown() {
        super.tearDown()
        
        if let domain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
        }
    }
    
    func testStoredInUserDefaultsIntValue() {
        struct Foo {
            @StoredInUserDefaults(key: "key")
            var value: Int
        }
        
        var foo = Foo()
        XCTAssertEqual(foo.value, Int.default)
        
        foo.value = 1
        XCTAssertEqual(foo.value, UserDefaults.standard.integer(forKey: "key"))
    }
    
    func testStoredInUserDefaultsOptionalValue() {
        struct Foo {
            @StoredInUserDefaults(key: "key")
            var value: Int?
        }
        
        var foo = Foo()
        XCTAssertEqual(foo.value, Optional<Int>.default)
        
        foo.value = 1
        XCTAssertEqual(foo.value, UserDefaults.standard.integer(forKey: "key"))
    }
    
    func testOnceStoredInUserDefaultsIntValue() {
        struct Foo {
            @StoredInUserDefaults(key: "key", strategy: .once)
            var value: Int
        }
        
        var foo = Foo()
        XCTAssertEqual(foo.value, Int.default)
        
        foo.value = 1
        XCTAssertEqual(foo.value, UserDefaults.standard.integer(forKey: "key"))
        
        foo.value = 2
        XCTAssertEqual(UserDefaults.standard.integer(forKey: "key"), 1)
    }
    
    func testOnceStoredInUserDefaultsOptionalValue() {
        struct Foo {
            @StoredInUserDefaults(key: "key", strategy: .once)
            var value: Int?
        }
        
        var foo = Foo()
        XCTAssertEqual(foo.value, Optional<Int>.default)
        
        foo.value = 1
        XCTAssertEqual(foo.value, UserDefaults.standard.integer(forKey: "key"))
        
        foo.value = 2
        XCTAssertEqual(UserDefaults.standard.integer(forKey: "key"), 1)
    }
}
