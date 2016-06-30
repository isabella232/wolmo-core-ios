//
//  AlertPresenter.swift
//  SonicWords
//
//  Created by Francisco Depascuali on 5/18/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public protocol AlertViewPresenter {
    
    func presentAlert(alertViewModel: ErrorAlertViewModel, completion: (() -> Void)?)
    
    func presentAlert(alertViewModel: ConfirmationAlertViewModel, completion: (() -> Void)?)
    
}

extension UIViewController: AlertViewPresenter {
    
    public func presentAlert(alertViewModel: ErrorAlertViewModel, completion: (() -> Void)? = .None) {
        let alert = UIAlertController.errorAlertController(alertViewModel)
        presentViewController(alert, animated: true, completion: completion)
    }
    
    public func presentAlert(alertViewModel: ConfirmationAlertViewModel, completion: (() -> Void)? = .None) {
        let alert = UIAlertController.confirmationAlertController(alertViewModel)
        presentViewController(alert, animated: true, completion: completion)
    }
    
}
