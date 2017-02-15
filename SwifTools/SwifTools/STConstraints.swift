//
//  STConstraints.swift
//  SwifTools
//
//  Created by Jason Pierna on 27/01/2017.
//  Copyright © 2017 Jason Pierna & Kévin Le. All rights reserved.
//

import UIKit

public class STConstraints {
    /**
     * Enumerates the possible side of a constraint.
     */
    public enum Sides {
        case left, right, top, bottom, leading, trailing
    }
    
    /**
     * Enumerates both size axis.
     */
    public enum Sizes {
        case width, height
    }
    
    /**
     Creates a size constraint on the selected view.
     - parameter view: The view to constraint
     - parameter sizes: The desired axis
     - parameter value: The size value
    */
    public static func addSizeConstraints(view: UIView, sizes: [STConstraints.Sizes], value: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        for size in sizes {
            switch size {
            case .width:
                view.widthAnchor.constraint(equalToConstant: value).isActive = true
            case .height:
                view.heightAnchor.constraint(equalToConstant: value).isActive = true
                
            }
        }
    }
    
    /**
     Creates a constraint between a view and one of its parent.
     - parameter parent: The view's parent
     - parameter child: The view ton constraint
     - parameter sides: The side to constraint
     - parameter constant: The distance between both views.
     */
    public static func addConstraints(parent firstView: UIView, child secondView: UIView, sides: [STConstraints.Sides], constant: CGFloat) {
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        for side in sides {
            switch side {
            case .left:
                applyXAxis(first: firstView.leftAnchor, second: secondView.leftAnchor, constant: constant)
            case .right:
                applyXAxis(first: firstView.rightAnchor, second: secondView.rightAnchor, constant: constant)
            case .leading:
                applyXAxis(first: firstView.leadingAnchor, second: secondView.leadingAnchor, constant: -constant)
            case .trailing:
                applyXAxis(first: firstView.trailingAnchor, second: secondView.trailingAnchor, constant: constant)
            case .top:
                applyYAxis(first: firstView.topAnchor, second: secondView.topAnchor, constant: -constant)
            case .bottom:
                applyYAxis(first: firstView.bottomAnchor, second: secondView.bottomAnchor, constant: constant)
            }
        }
    }
    
    /**
     Creates a constraint between a view and one of its parent. The constant is 0 by default.
     - parameter parent: The view's parent
     - parameter child: The view to constraint
     - parameter sides: The side to constraint
     */
    public static func addConstraints(parent firstView: UIView, child secondView: UIView, sides: [STConstraints.Sides]) {
        addConstraints(parent: firstView, child: secondView, sides: sides, constant: 0)
    }

    /**
     Creates a constraint between two child views. The constant is 0 by default.
     - parameter parent: The first view.
     - parameter child: The second view.
     - parameter sides: The side to constraint (relative to the first view)
     */
    public static func addConstraints(between firstView: UIView, and secondView: UIView, sides: [STConstraints.Sides]) {
        addConstraints(between: firstView, and: secondView, sides: sides, constant: 0)
    }
    
    /**
     Creates a constraint between two child views.
     - parameter parent: The first view.
     - parameter child: The second view.
     - parameter sides: The side to constraint (relative to the first view)
     - parameter constant: The distance between both views.
     */
    public static func addConstraints(between firstView: UIView, and secondView: UIView, sides: [STConstraints.Sides], constant: CGFloat) {
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        for side in sides {
            switch side {
            case .left:
                applyXAxis(first: firstView.leftAnchor, second: secondView.rightAnchor, constant: constant)
            case .right:
                applyXAxis(first: firstView.rightAnchor, second: secondView.leftAnchor, constant: -constant)
            case .leading:
                applyXAxis(first: firstView.leadingAnchor, second: secondView.trailingAnchor, constant: constant)
            case .trailing:
                applyXAxis(first: firstView.trailingAnchor, second: secondView.leadingAnchor, constant: constant)
            case .top:
                applyYAxis(first: firstView.topAnchor, second: secondView.bottomAnchor, constant: constant)
            case .bottom:
                applyYAxis(first: firstView.bottomAnchor, second: secondView.topAnchor, constant: -constant)
            }
        }
    }
    
    private static func applyXAxis(first: NSLayoutXAxisAnchor, second: NSLayoutXAxisAnchor, constant: CGFloat) {
        first.constraint(equalTo: second, constant: constant).isActive = true
    }
    
    private static func applyYAxis(first: NSLayoutYAxisAnchor, second: NSLayoutYAxisAnchor, constant: CGFloat) {
        first.constraint(equalTo: second, constant: constant).isActive = true
    }
}
