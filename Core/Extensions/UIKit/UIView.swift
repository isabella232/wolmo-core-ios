//
//  UIView.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//
import UIKit

public struct Border {
    
    let height: Float
    let color: UIColor
    
    init(height: Float, color: UIColor) {
        self.height = height
        self.color = color
    }
}

public enum ViewPositioning {
    case Back
    case Front
}

extension UIView {
    
    public func topBorder(border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: 0, y: 0, width: superview!.bounds.width - offset, height: CGFloat(border.height)))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    public func bottomBorder(border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: 0, y: bounds.height, width: superview!.bounds.width - offset,
            height: CGFloat(border.height)))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    public func leftBorder(border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(border.height), height: bounds.height))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    public func rigthBorder(border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: superview!.bounds.width - offset, y: 0, width: CGFloat(border.height),
            height: bounds.height))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    /// Loads the nib for the specific view , it will use the view name as the xib name.
    ///
    /// - parameter bundle: Specific bundle, default = mainBundle.
    /// - returns: The loaded UIView
    public static func loadFromNib<T: UIView>(bundle: NSBundle = NSBundle.mainBundle()) -> T {
        let nibName = NSStringFromClass(self).componentsSeparatedByString(".").last!
        return bundle.loadNibNamed(nibName, owner: self, options: nil).first as! T // swiftlint:disable:this force_cast
    }
    
    /// Loads the view into the specified containerView.
    ///
    /// It can be done after self's view is initialized, as it uses constraints to determine the size.
    ///
    /// - parameter containerView: The container view.
    /// - parameter viewPositioning: Back or Front. Default: Front
    public func loadInto(containerView: UIView, viewPositioning: ViewPositioning = .Front) {
        containerView.addSubview(self)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        
        containerView.topAnchor.constraintEqualToAnchor(topAnchor).active = true
        containerView.bottomAnchor.constraintEqualToAnchor(bottomAnchor).active = true
        containerView.leadingAnchor.constraintEqualToAnchor(leadingAnchor).active = true
        containerView.trailingAnchor.constraintEqualToAnchor(trailingAnchor).active = true
        
        if case viewPositioning = ViewPositioning.Back {
            containerView.sendSubviewToBack(self)
        }
    }
    
}

extension UIView {
    
    private var previousHeightConstraint: NSLayoutConstraint? {
        return constraints.filterFirst { $0.firstAttribute == .Height }
    }
    
}

private var hideableUIViewConstraintKey: UInt8 = 0

/**
 Collapse a view by adding/modifying constraint height.
 
 - Warning: It is intended to be used to collapse a view *without* subviews.
 
 - Parameter view: The view to collapse
 - Parameter animated: Indicates if the collapse should be animated.
 - Parameter animationDuration: The animationDuration of the collapse.
 */
public func collapse(view: UIView, animated: Bool = true, animationDuration: NSTimeInterval = 1) {
    if let previousHeightConstraint = view.previousHeightConstraint {
        // We save the previous height value
        setAssociatedObject(view, value: previousHeightConstraint.constant, key: &hideableUIViewConstraintKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        previousHeightConstraint.constant = 0
    } else {
        // We create a new height constraint with constant 0
        let zeroheightConstraint = view.heightAnchor.constraintEqualToConstant(0)
        zeroheightConstraint.active = true
    }
    
    view.setNeedsLayout()
    
    if animated {
        UIView.animateWithDuration(animationDuration) {
            view.layoutIfNeeded()
        }
    } else {
        view.layoutIfNeeded()
    }
}

/**
 Uncollapse a view by removing/modifying constraint height.
 
 **Warning:** It is intended to be used to uncollapse a view *without* subviews.
 
 - Parameter view: The view to collapse
 - Parameter animated: Indicates if the collapse should be animated.
 - Parameter animationDuration: The animationDuration of the collapse.
 */
func uncollapse(view: UIView, animated: Bool = true, animationDuration: NSTimeInterval = 1) {
    if let heightConstraint = view.previousHeightConstraint {
        // If we have a previous height, it means that before collapsing it had another height constraint.
        if let previousHeight: CGFloat = getAssociatedObject(view, key: &hideableUIViewConstraintKey) {
            heightConstraint.constant = previousHeight
        } else {
            // We desactive the height constraint added because it didn't have a height before collapsing.
            heightConstraint.active = false
        }
    }
    
    view.setNeedsLayout()
    if animated {
        UIView.animateWithDuration(animationDuration) {
            view.layoutIfNeeded()
        }
    } else {
        view.layoutIfNeeded()
    }
}
