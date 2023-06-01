import Foundation

@propertyWrapper
/// Обертка для проперти, которая позволяет брать значение из UserDefaults
public struct UserDefaultsStored<T> {
    private let key: String
    private let userDefaults: UserDefaults
    private let defaultValue: T

    public init(key: String, defaultValue: T, userDefaults: UserDefaults? = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefaults = userDefaults ?? .standard
    }

    public var wrappedValue: T {
        get {
            guard let value = userDefaults.value(forKey: key) as? T else { return defaultValue }
            return value
        }
        set { userDefaults.set(newValue, forKey: key) }
    }

    public var projectedValue: Self {
        return self
    }

    public func removeUserDefaultsValue() {
        userDefaults.removeObject(forKey: key)
    }

    public func registerValue() {
        userDefaults.register(defaults: [key: wrappedValue])
    }
}
