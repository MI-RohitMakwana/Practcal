//
//  LoginModel.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import Foundation

public struct LoginModel {

    let email: String
    let password: String

    var toDictionary: [String:Any] {
        return ["email": email, "password": password]
    }
}
