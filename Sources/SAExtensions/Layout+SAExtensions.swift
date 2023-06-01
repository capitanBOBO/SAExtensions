import UIKit

// MARK: Anchor

@discardableResult
public func ~= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalTo: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult
public func ~= <T>(lhs: NSLayoutAnchor<T>, rhs: (anchor: NSLayoutAnchor<T>, const: CGFloat)) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalTo: rhs.anchor, constant: rhs.const)
    constraint.isActive = true
    return constraint
}

@discardableResult
public func + <T>(lhs: NSLayoutAnchor<T>, rhs: CGFloat) -> (anchor: NSLayoutAnchor<T>, const: CGFloat) {
    return (anchor: lhs, const: rhs)
}

@discardableResult
public func - <T>(lsh: NSLayoutAnchor<T>, rsh: CGFloat) -> (anchor: NSLayoutAnchor<T>, const: CGFloat) {
    return (anchor: lsh, const: -rsh)
}

@discardableResult
public func >= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(greaterThanOrEqualTo: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult
public func <= <T>(lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(lessThanOrEqualTo: rhs)
    constraint.isActive = true
    return constraint
}

// MARK: Dimension

@discardableResult
public func + (lhs: NSLayoutDimension, rhs: CGFloat) -> (dimension: NSLayoutDimension, const: CGFloat) {
    return (dimension: lhs, const: rhs)
}

@discardableResult
public func - (lhs: NSLayoutDimension, rhs: CGFloat) -> (dimension: NSLayoutDimension, const: CGFloat) {
    return (dimension: lhs, const: -rhs)
}

@discardableResult
public func * (lhs: NSLayoutDimension, rhs: CGFloat) -> (dimension: NSLayoutDimension, multiplier: CGFloat) {
    return (dimension: lhs, multiplier: rhs)
}

@discardableResult
public func ~= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalTo: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult
public func ~= (lhs: NSLayoutDimension, rhs: (dimension: NSLayoutDimension, const: CGFloat)) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalTo: rhs.dimension, constant: rhs.const)
    constraint.isActive = true
    return constraint
}

@discardableResult
public func ~= (lhs: NSLayoutDimension, rhs: (dimension: NSLayoutDimension, multiplier: CGFloat)) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalTo: rhs.dimension, multiplier: rhs.multiplier)
    constraint.isActive = true
    return constraint
}

@discardableResult
public func ~= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalToConstant: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult
public func >= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    let constraint = lhs.constraint(greaterThanOrEqualToConstant: rhs)
    constraint.isActive = true
    return constraint
}

@discardableResult
public func <= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
    let constraint = lhs.constraint(lessThanOrEqualToConstant: rhs)
    constraint.isActive = true
    return constraint
}
