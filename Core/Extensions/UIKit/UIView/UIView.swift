//
//  UIView.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//
import UIKit

public struct ViewBorder {
    
    let thickness: Float
    let color: UIColor
    
    init(thickness: Float, color: UIColor) {
        self.thickness = thickness
        self.color = color
    }
}

public enum ViewPositioning {
    case back
    case front
}

extension UIView {
    
    private enum Direction {
        case Horizontal
        case Vertical
    }
    
    private func addBorderView(from border: ViewBorder, direction: Direction) -> UIView {
        let borderView = UIView(frame: .zero)
        borderView.backgroundColor = border.color
        addSubview(borderView)
        borderView.translatesAutoresizingMaskIntoConstraints = false
        let anchor = (direction == .Horizontal) ? borderView.heightAnchor : borderView.widthAnchor
        anchor.constraint(equalToConstant: CGFloat(border.thickness)).isActive = true
        return borderView
    }
    
    /**
     Adds a border to the top of the view, inside the view's bounds.
     
     - parameter border: Models the view border to be added.
     - parameter leftOffset: Offset from the view's left border to where the border should start.
            By default, 0.
     - parameter rightOffset: Offset from the view's right border to where the border should start.
            By default, 0.
     - parameter useConstraints: Boolean indicating whether to use constraints or frames. By default, true.
     
     - note: If you decide to use constraints to determine the size, self's frame doesn't need to be final.
             Because of this, it can be used in `loadView()`, `viewDidLoad()` or `viewWillAppear(animated:)`.
     */
    public func add(top border: ViewBorder,
                    withLeftOffset left: CGFloat = 0, rightOffset right: CGFloat = 0,
                    useConstraints: Bool = true) {
        if useConstraints {
            let borderView = addBorderView(from: border, direction: .Horizontal)
            borderView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            borderView.leftAnchor.constraint(equalTo: leftAnchor, constant: left).isActive = true
            rightAnchor.constraint(equalTo: borderView.rightAnchor, constant: right).isActive = true
        } else {
            let borderView = UIView(frame: CGRect(x: left,
                                                  y: 0,
                                                  width: bounds.width - left - right,
                                                  height: CGFloat(border.thickness)))
            borderView.backgroundColor = border.color
            addSubview(borderView)
        }
    }
    
    /**
     Adds a border to the bottom of the view, inside the view's bounds.
     
     - parameter border: Models the border to be added
     - parameter leftOffset: Offset from the view's left border to where the border should start.
            By default, 0.
     - parameter rightOffset: Offset from the view's right border to where the border should start.
            By default, 0.
     - parameter useConstraints: Boolean indicating whether to use constraints or frames. By default, true.
     
     - note: If you decide to use constraints to determine the size, self's frame doesn't need to be final.
             Because of this, it can be used in `loadView()`, `viewDidLoad()` or `viewWillAppear(animated:)`.
     */
    public func add(bottom border: ViewBorder,
                    withLeftOffset left: CGFloat = 0, rightOffset right: CGFloat = 0,
                    useConstraints: Bool = true) {
        if useConstraints {
            let borderView = addBorderView(from: border, direction: .Horizontal)
            borderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            borderView.leftAnchor.constraint(equalTo: leftAnchor, constant: left).isActive = true
            rightAnchor.constraint(equalTo: borderView.rightAnchor, constant: right).isActive = true
        } else {
            let borderView = UIView(frame: CGRect(x: left,
                                                  y: bounds.height - CGFloat(border.thickness),
                                                  width: bounds.width - left - right,
                                                  height: CGFloat(border.thickness)))
            borderView.backgroundColor = border.color
            addSubview(borderView)
        }
    }
    
    /**
     Adds a border to the left of the view, inside the view's bounds.
     
     - parameter border: Models the border to be added
     - parameter leftOffset: Offset from the view's left border to where the border should start.
            By default, 0.
     - parameter rightOffset: Offset from the view's right border to where the border should start.
            By default, 0.
     - parameter useConstraints: Boolean indicating whether to use constraints or frames. By default, true.
     
     - note: If you decide to use constraints to determine the size, self's frame doesn't need to be final.
             Because of this, it can be used in `loadView()`, `viewDidLoad()` or `viewWillAppear(animated:)`.
     */
    public func add(left border: ViewBorder,
                    withTopOffset top: CGFloat = 0, bottomOffset bottom: CGFloat = 0,
                    useConstraints: Bool = true) {
        if useConstraints {
            let borderView = addBorderView(from: border, direction: .Vertical)
            borderView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            borderView.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
            bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: bottom).isActive = true
        } else {
            let borderView = UIView(frame: CGRect(x: 0,
                                                  y: top,
                                                  width: CGFloat(border.thickness),
                                                  height: bounds.height - top - bottom))
            borderView.backgroundColor = border.color
            addSubview(borderView)
        }
    }
    
    /**
     Adds a border to the right of the view, inside the view's bounds.
     
     - parameter border: Models the border to be added
     - parameter leftOffset: Offset from the view's left border to where the border should start.
            By default, 0.
     - parameter rightOffset: Offset from the view's right border to where the border should start.
            By default, 0.
     - parameter useConstraints: Boolean indicating whether to use constraints or frames. By default, true.
     
     - note: If you decide to use constraints to determine the size, self's frame doesn't need to be final.
             Because of this, it can be used in `loadView()`, `viewDidLoad()` or `viewWillAppear(animated:)`.
     */
    public func add(right border: ViewBorder,
                    withTopOffset top: CGFloat = 0, bottomOffset bottom: CGFloat = 0,
                    useConstraints: Bool = true) {
        if useConstraints {
            let borderView = addBorderView(from: border, direction: .Vertical)
            borderView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            borderView.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
            bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: bottom).isActive = true
        } else {
            let borderView = UIView(frame: CGRect(x: bounds.width - CGFloat(border.thickness),
                                                  y: top,
                                                  width: CGFloat(border.thickness),
                                                  height: bounds.height - top - bottom))
            borderView.backgroundColor = border.color
            addSubview(borderView)
        }
    }
    
    /**
     Loads the view into the specified containerView.
     
     - parameter containerView: The container view.
     - parameter insets: Insets that separate self from the container view. By default, .zero.
     - parameter viewPositioning: Back or Front. By default, .front
     
     - note: It uses constraints to determine the size, so the frame isn't needed.
             Because of this, it can be used in `loadView()` or `viewDidLoad()`.
             Also, this function matches left inset to leading and right to trailing of the view.
     */
    public func add(into containerView: UIView,
                    with insets: UIEdgeInsets = .zero,
                    in viewPositioning: ViewPositioning = .front) {
        containerView.addSubview(self)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: containerView.topAnchor, constant: insets.top).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom).isActive = true
        leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: insets.left).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: insets.right).isActive = true
        
        if case viewPositioning = ViewPositioning.back {
            containerView.sendSubview(toBack: self)
        }
    }
    
}
