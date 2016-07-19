//
//  DeviceType.swift
//  SonicWords
//
//  Created by Francisco Depascuali on 5/18/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

/* 
 DeviceType provides the current device type.
 */
public enum DeviceType: CGFloat {
    case IPhone4s = 480.0
    case IPhone5 = 568.0
    case IPhone6 = 667.0
    case IPhone6Plus = 736.0
    case Unknown = -1
    
    /**
     Initializer that returns the current DeviceType.
    */
    public init() {
        let height = UIScreen.mainScreen().bounds.size.height
        self = DeviceType(rawValue: height) ?? .Unknown
    }
}
