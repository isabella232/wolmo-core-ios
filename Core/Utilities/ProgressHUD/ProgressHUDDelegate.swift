//
//  ProgressHUDDelegate.swift
//  SonicWords
//
//  Created by Francisco Depascuali on 5/19/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit
import MBProgressHUD

public protocol ProgressHUDDelegate {
    
    func showProgressHud()
    
    func showProgressHud(string: String)
    
    func hideProgressHud()
    
}

extension UIViewController: ProgressHUDDelegate {
    
    public func showProgressHud() {
        MBProgressHUD.showHUDAddedTo(view, animated: true)
    }
    
    public func showProgressHud(string: String) {
        let progressHUD = MBProgressHUD.showHUDAddedTo(view, animated: true)
        progressHUD.labelText = string
    }
    
    public func hideProgressHud() {
        MBProgressHUD.hideHUDForView(view, animated: true)
    }
    
}
