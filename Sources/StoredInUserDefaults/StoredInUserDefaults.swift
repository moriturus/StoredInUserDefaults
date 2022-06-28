// Copyright (c) 2022 Henrique Sasaki Yuya
// This software is released under the MIT License.
// See LICENSE file for details.

import Default
import Foundation
import StoredIn

// MARK: - UserDefaults + Store

extension UserDefaults: Store {
    public typealias Key = String

    public func containsValue(forKey key: String) -> Bool {
        object(forKey: key) != nil
    }

    public func value<S>(forKey key: String) -> S? where S: Storable {
        object(forKey: key) as? S
    }

    public func set<S>(value: S, forKey key: String) where S: Storable {
        self.set(value, forKey: key)
    }
}

public extension StoredIn where S == UserDefaults {
    init(userDefaults: UserDefaults = .standard, key: K, default: V, strategy: Strategy = .default) {
        self.init(store: userDefaults, key: key, default: `default`, strategy: strategy)
    }
}

public extension StoredIn where S == UserDefaults, V: Default {
    init(
        userDefaults: UserDefaults = .standard,
        key: K,
        defaultValue: V = V.default,
        strategy: Strategy = .default
    ) {
        self.init(userDefaults: userDefaults, key: key, default: defaultValue, strategy: strategy)
    }
}

public typealias StoredInUserDefaults<V> = StoredIn<UserDefaults, String, V> where V: StoringTypeConvertible
