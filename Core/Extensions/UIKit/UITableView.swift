//
//  UITableView.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

public extension UITableView {
    
    /**
     Registers a cell to be used by a UITableView.
     
     - parameter cellType: An identifiable cell to take the identifier from.
     */
    func register(cellType: IdentifiableCell.Type, bundle: Bundle? = .none) {
        register(UINib(nibName: cellType.cellIdentifier, bundle: bundle), forCellReuseIdentifier: cellType.cellIdentifier)
    }
    
}
