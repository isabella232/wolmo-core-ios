//
//  UIViewController.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    /**
     Toggles the visibility of the status and tabBar.
     */
    public var hideBars: Bool {
        set {
            setHiddenValueFromBarsTo(newValue)
        }
        
        get {
            return false
        }
    }
    
    /**
     Loads the childViewController into the specified containerView.
     
     It can be done after self's view is initialized, as it uses constraints to determine the childViewController size.
     Take into account that self will retain the childViewController, so if for any other reason the childViewController is retained in another place, this would
     lead to a memory leak. In that case, one should call unloadViewController().
     
     - parameter childViewController: The controller to load.
     - parameter into: The containerView into which the controller will be loaded.
     - parameter viewPositioning: Back or Front. Default: Front
     */
    public func loadViewController(_ childViewController: UIViewController, into containerView: UIView, viewPositioning: ViewPositioning = .front) {
        childViewController.willMove(toParentViewController: self)
        addChildViewController(childViewController)
        childViewController.didMove(toParentViewController: self)
        childViewController.view.loadInto(containerView, viewPositioning: viewPositioning)
    }
    
    /**
     Unloads a childViewController and its view from its parentViewController.
     */
    public func unloadFromParentViewController() {
        view.removeFromSuperview()
        removeFromParentViewController()
    }
}

private extension UIViewController {
    
    func setHiddenValueFromBarsTo(_ value: Bool) {
        tabBarController?.tabBar.isHidden = value
        UIApplication.shared.isStatusBarHidden = value
    }
    
}
