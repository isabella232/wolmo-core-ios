//
//  ConfirmationAlertViewModel.swift
//  SonicWords
//
//  Created by Francisco Depascuali on 5/18/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

/**
 ConfirmationAlertViewModel models a `UIAlertController` that can be confirmed or dismissed.
 */
public struct ConfirmationAlertViewModel {
    
    public let title: String
    public let message: String
    public let dismissButtonTitle: String
    public let confirmButtonTitle: String
    public let dismissAction: ConfirmationAlertViewModel -> ()
    public let confirmAction: ConfirmationAlertViewModel -> ()
    
    /**
     Initialize a new ConfirmationAlertViewModel with the provided parameters.
     
     Is not necessary to provide all parameters. In most cases, its only
     needed `title`, `message` and `confirmAtion`.
     
     - parameter title: The alert title.
     - parameter message: The alert message.
     - parameter dismissButtonTitle: The dismiss button title.
     - parameter dismissAction: The dismiss button action.
     - parameter confirmButtonTitle: The confirm button title.
     - parameter confirmAction: The confirm button action.
     */
    public init(
        title: String,
        message: String,
        dismissButtonTitle: String = DefaultDismissButtonTitleKey.localized.localizedCapitalizedString,
        dismissAction: ConfirmationAlertViewModel -> () = { _ in },
        confirmButtonTitle: String = DefaultConfirmButtonTitleKey.localized.localizedCapitalizedString,
        confirmAction: ConfirmationAlertViewModel -> () = { _ in }) {
        self.title = title
        self.message = message
        self.confirmAction = confirmAction
        self.dismissAction = dismissAction
        self.dismissButtonTitle = dismissButtonTitle
        self.confirmButtonTitle = confirmButtonTitle
    }
    
    /**
     Default title key for confirm button. It will fetch the localized value from the corresponding Localizable.String. 
     You can provide a different key by changing this property.
     - seealso: Localizable.String
     */
    public static var DefaultConfirmButtonTitleKey: String = "confirmation-alert-view.dismiss.title"
    
    /**
     Default title key for dismiss button. It will fetch the localized value from the corresponding Localizable.String.
     You can provide a different key by changing this property.
     - seealso: Localizable.String
     */
    public static var DefaultDismissButtonTitleKey: String = "confirmation-alert-view.confirm.title"
}
