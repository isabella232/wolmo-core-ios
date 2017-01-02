//
//  Collapsable.swift
//  Core
//
//  Created by Francisco Depascuali on 7/6/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

/**
 Represents a collapsable element.
 */
public protocol Collapsable {
    
    /**
     Collapse self.
     
     - Parameter animated: Indicates if the collapse should be animated.
     - Parameter animationDuration: The animationDuration of the collapse.
     */
    func collapse(_ animated: Bool, animationDuration: TimeInterval)
    
    /**
     Uncollapse self.
     
     - Parameter animated: Indicates if the collapse should be animated.
     - Parameter animationDuration: The animationDuration of the collapse.
     */
    func uncollapse(_ animated: Bool, animationDuration: TimeInterval)
    
}

/**
 Represents a vertical collapsable view, which when collapsed not only isn't shown but isn't considered in vertical layout.
 */
extension Collapsable where Self: UIView {
    
    /**
     Collapse a view by adding/modifying constraint height. It works also if they view already has a constraint.
     
     - Warning: It is intended to be used to collapse a view *without* subviews.
     
     - Parameter view: The view to collapse
     - Parameter animated: Indicates if the collapse should be animated.
     - Parameter animationDuration: The animationDuration of the collapse.
     */
    public func collapse(_ animated: Bool = true, animationDuration: TimeInterval = 1) {
        if let previousHeightConstraint = previousHeightConstraint {
            // We save the previous height value
            setAssociatedObject(self, key: &CollapsableHeightConstraintKey, value: previousHeightConstraint.constant, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            previousHeightConstraint.constant = 0
        } else {
            // We create a new height constraint with constant 0
            let zeroheightConstraint = heightAnchor.constraint(equalToConstant: 0)
            zeroheightConstraint.isActive = true
        }
        
        updateView(animated, animationDuration: animationDuration)
    }
    
    /**
     Uncollapse a view by removing/modifying constraint height. It works also if they view already has a constraint.
     
     **Warning:** It is intended to be used to uncollapse a view *without* subviews.
     
     - Parameter view: The view to collapse
     - Parameter animated: Indicates if the collapse should be animated.
     - Parameter animationDuration: The animationDuration of the collapse.
     */
    public func uncollapse(_ animated: Bool = true, animationDuration: TimeInterval = 1) {
        if let heightConstraint = previousHeightConstraint {
            // If we have a previous height, it means that before collapsing it had another height constraint.
            if let previousHeight: CGFloat = getAssociatedObject(self, key: &CollapsableHeightConstraintKey) {
                heightConstraint.constant = previousHeight
            } else {
                // We desactive the height constraint added because it didn't have a height before collapsing.
                heightConstraint.isActive = false
            }
        }
        
        updateView(animated, animationDuration: animationDuration)
    }
    
    fileprivate func updateView(_ animated: Bool, animationDuration: TimeInterval) {
        setNeedsLayout()
        
        if animated {
            UIView.animate(withDuration: animationDuration, animations: {
                self.layoutIfNeeded()
            }) 
        } else {
            layoutIfNeeded()
        }
    }
}

private var CollapsableHeightConstraintKey: UInt8 = 0

private extension UIView {
    
    var previousHeightConstraint: NSLayoutConstraint? {
        return constraints.filterFirst { $0.firstAttribute == .height }
    }
    
}
