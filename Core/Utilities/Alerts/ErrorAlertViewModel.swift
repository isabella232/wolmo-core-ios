//
//  ErrorAlertViewModel.swift
//  SonicWords
//
//  Created by Francisco Depascuali on 5/18/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

/**
 ErrorAlertViewModel models a `UIAlertController` used to report and error alert.
 */
public struct ErrorAlertViewModel {
    
    public let title: String
    public let message: String
    public let dismissButtonTitle: String
    public let dismissAction: ErrorAlertViewModel -> ()
    
    /**
     Initialize a new ErrorAlertViewModel with the provided parameters.
     
     - parameter title: The alert title.
     - parameter message: The alert message.
     - parameter dismissButtonTitle: The dismiss button title.
     - parameter dismissAction: The dismiss button action.
     */
    public init(
        title: String,
        message: String,
        dismissButtonTitle: String = DefaultDismissButtonTitle,
        dismissAction: ErrorAlertViewModel -> () = { _ in }) {
        self.title = title
        self.message = message
        self.dismissAction = dismissAction
        self.dismissButtonTitle = dismissButtonTitle
    }
    
    /**
     Default title for dismiss button. You can provide a different default title by changing this property.
     - seealso: Localizable.String
     */
    public static var DefaultDismissButtonTitle: String = "error-alert-view.dismiss.title".localized.capitalizedString
}
