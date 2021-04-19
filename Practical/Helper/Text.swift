//
//  Text.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import Foundation

struct AlertMessage {
    static let validEmail = "This is a invalid email."
    static let validPassword = "Passwords require at least 1 uppercase, 1 lowercase, and 1 number."
}

struct Title {
    static let OK = "OK"
    static let Yes = "Yes"
    static let No = "No"
    static let Error = "Error"
    static let Login = "Login"
}

enum RegexType: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case password = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,16}$"
}
