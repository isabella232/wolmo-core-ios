//
//  UIAlertController.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    public static func confirmationAlertController(alertViewModel: ConfirmationAlertViewModel) -> UIAlertController {
        let alertController = UIAlertController(title: alertViewModel.title,
                                                message: alertViewModel.message,
                                                preferredStyle: UIAlertControllerStyle.Alert)
        
        let confirmAction = UIAlertAction(title: alertViewModel.confirmButtonTitle, style: UIAlertActionStyle.Default) { _ in
            alertViewModel.confirmAction(alertViewModel)
        }
        
        let dismissAction = UIAlertAction(title: alertViewModel.dismissButtonTitle, style: UIAlertActionStyle.Default) { _ in
            alertViewModel.dismissAction(alertViewModel)
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(dismissAction)
        
        return alertController
    }
    
    public static func errorAlertController(alertViewModel: ErrorAlertViewModel) -> UIAlertController {
        let alertController = UIAlertController(title: alertViewModel.title,
                                                message: alertViewModel.message,
                                                preferredStyle: UIAlertControllerStyle.Alert)
        
        let dismissAction = UIAlertAction(title: alertViewModel.dismissButtonTitle, style: UIAlertActionStyle.Default) { _ in
            alertViewModel.dismissAction(alertViewModel)
        }
        
        alertController.addAction(dismissAction)
        
        return alertController
    }
    
}
