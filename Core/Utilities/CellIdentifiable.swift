//
//  CellIdentifiable.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

/**
 Identifies a cell
 */
public protocol IdentifiableCell {
    
    static var cellIdentifier: String { get }
    
}

extension UITableViewCell: IdentifiableCell {
    /**
     Returns the identifier of the class. It is the name of the class.
     */
    public static var cellIdentifier: String { return String(self) }
    
}
