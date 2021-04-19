//
//  Extension+String.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", RegexType.email.rawValue)
        return emailPred.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        // least one uppercase,
        // least one digit
        // least one lowercase
        // min 8 & max 16 characters
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", RegexType.password.rawValue)
        return passwordCheck.evaluate(with: self)
    }
}


