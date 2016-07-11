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
    
    /** 
     Adds a border to the top of self.
     
     - parameter border: models the border to be added
     - parameter offset: the offset of the border related to self.
    */
    public func addTopBorder(border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: 0, y: 0, width: superview!.bounds.width - offset, height: CGFloat(border.height)))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    /**
     Adds a border to the bottom of self.
     
     - parameter border: models the border to be added
     - parameter offset: the offset of the border related to self.
     */
    public func addBottomBorder(border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: 0, y: bounds.height, width: superview!.bounds.width - offset,
            height: CGFloat(border.height)))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    /**
     Adds a border to the left of self.
     
     - parameter border: models the border to be added
     - parameter offset: the offset of the border related to self.
     */
    public func addLeftBorder(border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(border.height), height: bounds.height))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    /**
     Adds a border to the right of self.
     
     - parameter border: models the border to be added
     - parameter offset: the offset of the border related to self.
     */
    public func addRightBorder(border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: superview!.bounds.width - offset, y: 0, width: CGFloat(border.height),
            height: bounds.height))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    /**
     Loads the view into the specified containerView.
     
     - warning: It must be done after self's view is loaded.
     - note: It uses constraints to determine the size, so the frame isn't needed. Because of this, `loadInto()` can be used in viewDidLoad().
     - parameter containerView: The container view.
     - parameter viewPositioning: Back or Front. Default: Front
     */
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
