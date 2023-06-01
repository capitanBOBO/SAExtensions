import Foundation

public extension Array {
    subscript(safe index: Int) -> Element? {
        guard indices ~= index else { return nil }
        return self[index]
    }

    func unique() -> [Element] where Element: Equatable {
        var uniqueElements: [Element] = []
        forEach { item in
            if !uniqueElements.contains(item) {
                uniqueElements.append(item)
            }
        }
        return uniqueElements
    }
}
