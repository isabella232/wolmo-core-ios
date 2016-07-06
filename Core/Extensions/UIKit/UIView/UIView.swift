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
    
    public func rightBorder(border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: superview!.bounds.width - offset, y: 0, width: CGFloat(border.height),
            height: bounds.height))
        borderView.backgroundColor = border.color
        addSubview(borderView)
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
