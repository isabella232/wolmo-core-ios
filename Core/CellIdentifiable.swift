//
//  CellIdentifiable.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

public protocol IdentifiableCell {
    
    static var cellIdentifier: String { get }
    
}

extension UITableViewCell: IdentifiableCell {
    
    public static var cellIdentifier: String { return String(self) }
    
}
