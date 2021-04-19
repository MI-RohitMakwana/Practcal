//
//  Text.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import Foundation

struct Title {
    static let OK = "OK"
    static let Error = "Error"
    static let Login = "Login"
    static let Welcome = "Welcome"
}

enum RegexType: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case password = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,16}$"
}
