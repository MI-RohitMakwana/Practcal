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

struct LoginResultModel: Codable {
    let result: Int
    let errorMessage: String
    let data: DataClass

    init() {
        result = 0
        errorMessage = "Something went wrong"
        data = DataClass(user: nil)
    }

    enum CodingKeys: String, CodingKey {
        case result
        case errorMessage = "error_message"
        case data
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let user: User?
}

// MARK: - User
struct User: Codable {
    let userID: Int
    let userName, createdAt: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case userName
        case createdAt = "created_at"
    }
}
