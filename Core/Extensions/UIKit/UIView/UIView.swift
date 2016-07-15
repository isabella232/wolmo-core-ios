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
