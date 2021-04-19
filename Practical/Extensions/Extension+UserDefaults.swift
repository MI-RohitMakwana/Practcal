//
//  Extension+UserDefaults.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import Foundation
import UIKit

extension UserDefaults {
    
    var user : User? {
        get {
            if let user = UserDefaults.standard.object(forKey: "user") as? [String:Any] {
                return User(user)
            } else {
                print("There is an issue")
                return nil
            }
        }
        set {
            UserDefaults.standard.set(newValue?.toDictionary, forKey: "user")
        }
    }
}
