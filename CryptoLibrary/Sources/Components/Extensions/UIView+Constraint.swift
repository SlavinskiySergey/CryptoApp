//
//  UIView+Constraint.swift
//  Components
//

import UIKit

public typealias Constraint = (_ child: UIView, _ parent: UIView) -> NSLayoutConstraint

public func equal<Axis, Anchor>(
    _ keyPath: KeyPath<UIView, Anchor>,
    _ to: KeyPath<UIView, Anchor>,
    constant: CGFloat = 0
) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { view, parent in
        view[keyPath: keyPath].constraint(equalTo: parent[keyPath: to], constant: constant)
    }
}

public func equal<Axis, Anchor>(
    _ keyPath: KeyPath<UIView, Anchor>,
    constant: CGFloat = 0
) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return equal(keyPath, keyPath, constant: constant)
}

public func equal<Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                          constant: CGFloat,
                          priority: UILayoutPriority = .required
) -> Constraint where Anchor: NSLayoutDimension {
    return { view, parent in
        let constraint = view[keyPath: keyPath].constraint(equalToConstant: constant)
        constraint.priority = priority
        return constraint
    }
}

extension UIView {
    public func addSubview(_ child: UIView, constraints: [Constraint]) {
        addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(child, self) })
    }
    
    public func fillWith(_ child: UIView) {
        addSubview(child, constraints: [equal(\.topAnchor), equal(\.leftAnchor), equal(\.rightAnchor), equal(\.bottomAnchor)])
    }
    
    public func addSubview(_ child: UIView, layout: Layout) {
        addSubview(child, constraints: layout.constraints)
    }
    
    private func alignSubview(_ child: UIView, constraints: [Constraint]) {
        guard child.superview === self else {
            return
        }
        
        NSLayoutConstraint.activate(constraints.map { $0(child, self) })
    }
    
    func alignInSuperview(constraints: [Constraint]) {
        guard let parent = superview else {
            return
        }
        
        parent.alignSubview(self, constraints: constraints)
    }
        
    public func removeConstraints() {
        constraints.forEach({ removeConstraint($0) })
    }
}
