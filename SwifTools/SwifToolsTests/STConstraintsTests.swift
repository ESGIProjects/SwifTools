//
//  STConstraintsTests.swift
//  SwifTools
//
//  Created by Jason Pierna on 08/02/2017.
//  Copyright © 2017 Jason Pierna & Kévin Le. All rights reserved.
//

import XCTest
@testable import SwifTools

class STConstraintsTests: XCTestCase {
    
    var view1: UIView!
    var view2: UIView!
    
    override func setUp() {
        super.setUp()
        
        view1 = UIView()
        view2 = UIView()
    }
    
    override func tearDown() {
        view1 = nil
        view2 = nil
        super.tearDown()
    }
    
    func testSizeConstraints() {
        STConstraints.addSizeConstraints(view: view1, sizes: [.width], value: 0)
        STConstraints.addSizeConstraints(view: view2, sizes: [.height], value: 0)
        
        let constraintView1 = view1.constraints.first!
        let constraintView2 = view2.constraints.first!
        
        XCTAssertTrue(constraintView1.firstAttribute == .width)
        XCTAssertFalse(constraintView1.firstAttribute == .height)
        
        XCTAssertFalse(constraintView2.firstAttribute == .width)
        XCTAssertTrue(constraintView2.firstAttribute == .height)
    }
    
    func testSideConstraints() {
        let superview = UIView()
        superview.addSubview(view1)
        superview.addSubview(view2)
        
        STConstraints.addConstraints(between: view1, and: view2, sides: [.top])
        
        let constraint = superview.constraints.first {
            ($0.firstItem === view1 || $0.firstItem === view2) && ($0.secondItem === view1 || $0.secondItem === view2)
        }
        
        if let constraint = constraint {
            XCTAssertTrue(constraint.firstAttribute == .top)
            XCTAssertTrue(constraint.secondAttribute == .bottom)
        }
    }
}
