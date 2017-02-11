//
//  STQuickActionsTests.swift
//  SwifTools
//
//  Created by Jason Pierna on 10/02/2017.
//  Copyright © 2017 Jason Pierna & Kévin Le. All rights reserved.
//

import XCTest
@testable import SwifTools
import LocalAuthentication

class STQuickActionsTests: XCTestCase {
    var manager: STQuickActions = STQuickActions.shared
    
    func testAdd() {
        manager.add(title: "Test")
        if let action = UIApplication.shared.shortcutItems?.first {
            XCTAssertTrue(action.localizedTitle == "Test")
        }
    }
    
    func testRemove() {
        manager.add(title: "Test")
        manager.add(title: "Test")
        manager.remove(.first)
        
        if let count = UIApplication.shared.shortcutItems?.count {
            XCTAssertTrue(count == 1)
        }
    }
    
    func testRemoveAll() {
        manager.add(title: "Test")
        manager.add(title: "Test")
        manager.removeAll()
        
        XCTAssertNil(UIApplication.shared.shortcutItems)
    }
}
