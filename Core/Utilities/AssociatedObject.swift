//
//  AssociatedObject.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

private final class AssociatedObjectBox<T> {
    let value: T
    
    init(_ value: T) {
        self.value = value
    }
}

private func lift<T>(value: T) -> AssociatedObjectBox<T> {
    return AssociatedObjectBox(value)
}

public func setAssociatedObject<T>(object: AnyObject, key: UnsafePointer<Void>, value: T, policy: objc_AssociationPolicy) {
    if let value = value as? AnyObject {
        objc_setAssociatedObject(object, key, value, policy)
    } else {
        objc_setAssociatedObject(object, key, lift(value), policy)
    }
}

public func getAssociatedObject<T>(object: AnyObject, key: UnsafePointer<Void>) -> T? {
    if let value = objc_getAssociatedObject(object, key) as? T {
        return value
    } else if let value = objc_getAssociatedObject(object, key) as? AssociatedObjectBox<T> {
        return value.value
    } else {
        return .None
    }
}
