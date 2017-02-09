//
//  STTouchIDTests.swift
//  SwifTools
//
//  Created by Kévin Le on 07/02/2017.
//  Copyright © 2017 Jason Pierna & Kévin Le. All rights reserved.
//

import XCTest
@testable import SwifTools
import LocalAuthentication

class STTouchIDTests: XCTestCase {
    func testCheck() {
        class FakeContext: LAContext {
            override func evaluatePolicy(_ policy: LAPolicy, localizedReason: String, reply: @escaping (Bool, Error?) -> Void) {
                reply(true, nil)
            }
            override func canEvaluatePolicy(_ policy: LAPolicy, error: NSErrorPointer) -> Bool {
                return true
            }
        }
        
        let handler = STTouchID()
        handler.context = FakeContext()
        handler.check(message: "Test", completionHandler: { success, _ in
            XCTAssertTrue(success)
        })
    }
}
