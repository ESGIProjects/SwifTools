//
//  STAuthenticationTests.swift
//  SwifTools
//
//  Created by Kévin Le on 07/02/2017.
//  Copyright © 2017 Jason Pierna & Kévin Le. All rights reserved.
//

import XCTest
@testable import SwifTools
import LocalAuthentication

class STAuthenticationTests: XCTestCase {
	
	class FakeContext: LAContext {
		override func evaluatePolicy(_ policy: LAPolicy, localizedReason: String, reply: @escaping (Bool, Error?) -> Void) {
			reply(true, nil)
		}
		override func canEvaluatePolicy(_ policy: LAPolicy, error: NSErrorPointer) -> Bool {
			return true
		}
	}
	
    func testCheck() {
        let handler = STAuthentication()
        handler.context = FakeContext()
        handler.check(message: "") { success, _ in
            XCTAssertTrue(success)
        }
    }
}
