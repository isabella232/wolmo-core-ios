//
//  ProgressHUDDelegate.swift
//  SonicWords
//
//  Created by Francisco Depascuali on 5/19/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit
import MBProgressHUD

/**
 ProgressHUDDelegate abstracts the logic of presenting a progress HUD, usually used in blocking operation, just as sign up.
 */
public protocol ProgressHUDDelegate {
    
    func showProgressHud(labelText: String?)
    
    func hideProgressHud()
    
}

extension UIViewController: ProgressHUDDelegate {
    
    /**
     Show a progress hud attached to the viewController's view.
     - parameter labelText: A label text to be shown under the progress hud.
     - Warning: Showing a progress hud freezes the viewController's view.
     */
    public func showProgressHud(labelText: String? = .None) {
        let progressHUD = MBProgressHUD.showHUDAddedTo(view, animated: true)
        
        if let labelText = labelText {
            progressHUD.labelText = labelText
        }
    }
    
    /**
     Hides the view associated with the ViewController.
     */
    public func hideProgressHud() {
        MBProgressHUD.hideHUDForView(view, animated: true)
    }
    
}
