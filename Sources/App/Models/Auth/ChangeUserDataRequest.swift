//
//  ChangeUserDataRequest.swift
//  
//
//  Created by Vitaliy Talalay on 31.03.2022.
//

import Vapor

struct ChangeUserDataRequest: Content {
    var userID: Int
    var userName: String
    var password: String
    var email: String
}
