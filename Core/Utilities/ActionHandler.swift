//
//  ActionHandler.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

public protocol ActionHandlerType {}

extension ActionHandlerType where Self: UIControl {
    
    /**
     It adds the closure as target for that event, but retains any object use in the closure.
     So if using self, you should probably use weak or onowned self.
     
     - Parameter events: Control event for which the action is registered. TouchUpInside is default.
     - Parameter action: Closure that receives the UIControl and the UIEvent and processes them.
     */
    public func setAction(events: UIControlEvents = .TouchUpInside, _ action: (Self, UIEvent) -> Void) {
        let handler = ActionHandler(action: action)
        addTarget(handler, action: #selector(handler.action(_:forEvent:)), forControlEvents: events)
        objc_setAssociatedObject(self, actionHandlerTypeAssociatedObjectKey, handler, .OBJC_ASSOCIATION_RETAIN)
    }
    
}

extension UIControl: ActionHandlerType {}

private let actionHandlerTypeAssociatedObjectKey = UnsafeMutablePointer<Int8>.alloc(1)

private class ActionHandler<T>: NSObject {
    private let _action: ((T, UIEvent) -> Void)
    
    init(action: (T, UIEvent) -> Void) {
        _action = action
    }
    
    @objc func action(sender: UIControl, forEvent event: UIEvent) {
        if let sender = sender as? T {
            _action(sender, event)
        }
    }
    
}
