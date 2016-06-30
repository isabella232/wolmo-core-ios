//
//  ErrorAlertViewModel.swift
//  SonicWords
//
//  Created by Francisco Depascuali on 5/18/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public struct ErrorAlertViewModel {
    public let title: String
    public let message: String
    public let dismissButtonTitle: String
    public let dismissAction: ErrorAlertViewModel -> ()
    
    public init(
        title: String,
        message: String,
        dismissButtonTitle: String = "error-alert-view.dismiss.title".localized.uppercaseString,
        dismissAction: ErrorAlertViewModel -> () = { _ in }) {
        self.title = title
        self.message = message
        self.dismissAction = dismissAction
        self.dismissButtonTitle = dismissButtonTitle
    }
}
