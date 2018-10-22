//
//  STAuthentication.swift
//  SwifTools
//
//  Created by Kévin Le on 06/02/2017.
//  Copyright © 2017 Jason Pierna & Kévin Le. All rights reserved.
//

import UIKit
import LocalAuthentication

public class STAuthentication {
    
    var context = LAContext()
    
    public init() {}
    
    /**
     Check if Touch ID feature is available
     */
    public func isAvailable() -> Bool {
        var error: NSError?
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
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
