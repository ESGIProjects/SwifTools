//
//  STTouchID.swift
//  SwifTools
//
//  Created by Kévin Le on 06/02/2017.
//  Copyright © 2017 Jason Pierna & Kévin Le. All rights reserved.
//

import UIKit
import LocalAuthentication


public class STTouchID {
    
    var context = LAContext()
    
    /**
     Check if Touch ID feature is available
     */
    public func isAvailable() -> Bool {
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return false
        }
        return true
    }
    
    /**
     Display an UIAlertController in order to use Touch ID
     - parameter message: The message displayed in the UIAlertController
     - parameter completionHandler: The set of actions triggered when authenticated
    */
    public func check(message: String, completionHandler: @escaping (Bool, Error?) -> Void) {
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: message, reply: completionHandler)
    }
}
