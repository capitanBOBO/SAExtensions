import UIKit
import Foundation

public extension UIView {
    enum SASide {
        case top, left, bottom, right
    }

    @discardableResult func autolayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    func fillSuperview(offset: CGFloat = 0) {
        guard let superview = self.superview else {
            fatalError("Not in superview")
        }
        topAnchor ~= superview.topAnchor + offset
        leftAnchor ~= superview.leftAnchor + offset
        bottomAnchor ~= superview.bottomAnchor - offset
        rightAnchor ~= superview.rightAnchor - offset
    }

    func pinSidesToSuperviewSides(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) {
        guard let superview = self.superview else {
            fatalError("Not in superview")
        }
        if let side = top { topAnchor ~= superview.topAnchor + side }
        if let side = left { leftAnchor ~= superview.leftAnchor + side }
        if let side = bottom { bottomAnchor ~= superview.bottomAnchor - side }
        if let side = right { rightAnchor ~= superview.rightAnchor - side }
    }

    func pinSidesToSuperviewSides(excluding sides: [SASide] = [], offset: CGFloat = 0) {
        guard let superview = self.superview else {
            fatalError("Not in superview")
        }
        if !sides.contains(.top) { topAnchor ~= superview.topAnchor + offset }
        if !sides.contains(.left) { leftAnchor ~= superview.leftAnchor + offset }
        if !sides.contains(.bottom) { bottomAnchor ~= superview.bottomAnchor - offset }
        if !sides.contains(.right) { rightAnchor ~= superview.rightAnchor - offset }
    }

    func pinToSuperviewCenter() {
        guard let superview = self.superview else {
            fatalError("Not in superview")
        }
        centerXAnchor ~= superview.centerXAnchor
        centerYAnchor ~= superview.centerYAnchor
    }

    func matchSize(to view: UIView) {
        heightAnchor ~= view.heightAnchor
        widthAnchor ~= view.widthAnchor
    }
}
