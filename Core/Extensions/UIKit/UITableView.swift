//
//  UITableView.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func registerCell(cellType: IdentifiableCell.Type) {
        registerNib(UINib(nibName: cellType.cellIdentifier, bundle: nil), forCellReuseIdentifier: cellType.cellIdentifier)
    }
    
}
