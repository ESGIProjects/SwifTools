//
//  STConstraints.swift
//  SwiftyFramework
//
//  Created by Jason Pierna on 27/01/2017.
//  Copyright © 2017 Jason Pierna & Kévin Le. All rights reserved.
//

import UIKit

class STConstraints {
    
    enum Sides {
        case left, right, top, bottom, leading, trailing
    }
    
    public static func addConstraint(parent firstView: UIView, child secondView: UIView, side: STConstraints.Sides) {
        addConstraints(parent: firstView, child: secondView, sides: [side])
    }
    
    public static func addConstraints(parent firstView: UIView, child secondView: UIView, sides: [STConstraints.Sides]) {
        
        for side in sides {
            switch side {
            case .left:
                applyXAxis(first: firstView.leftAnchor, second: secondView.leftAnchor)
            case .right:
                applyXAxis(first: firstView.rightAnchor, second: secondView.rightAnchor)
            case .leading:
                applyXAxis(first: firstView.leadingAnchor, second: secondView.leadingAnchor)
            case .trailing:
                applyXAxis(first: firstView.trailingAnchor, second: secondView.trailingAnchor)
            case .top:
                applyYAxis(first: firstView.topAnchor, second: secondView.topAnchor)
            case .bottom:
                applyYAxis(first: firstView.bottomAnchor, second: secondView.bottomAnchor)
            }
        }
    }
    
    public static func addConstraint(between firstView: UIView, and secondView: UIView, side: STConstraints.Sides) {
        addConstraints(between: firstView, and: secondView, sides: [side])
    }
    
    public static func addConstraints(between firstView: UIView, and secondView: UIView, sides: [STConstraints.Sides]) {
        
    }
    
    private static func applyXAxis(first: NSLayoutXAxisAnchor, second: NSLayoutXAxisAnchor) {
        first.constraint(equalTo: second).isActive = true
    }
    
    private static func applyYAxis(first: NSLayoutYAxisAnchor, second: NSLayoutYAxisAnchor) {
        first.constraint(equalTo: second).isActive = true
    }
}
