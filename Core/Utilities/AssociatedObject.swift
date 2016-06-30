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

public func setAssociatedObject<T>(object: AnyObject, value: T, key: UnsafePointer<Void>, policy: objc_AssociationPolicy) {
    if let v: AnyObject = value as? AnyObject {
        objc_setAssociatedObject(object, key, v, policy)
    } else {
        objc_setAssociatedObject(object, key, lift(value), policy)
    }
}

public func getAssociatedObject<T>(object: AnyObject, key: UnsafePointer<Void>) -> T? {
    if let v = objc_getAssociatedObject(object, key) as? T {
        return v
    } else if let v = objc_getAssociatedObject(object, key) as? AssociatedObjectBox<T> {
        return v.value
    } else {
        return nil
    }
}
