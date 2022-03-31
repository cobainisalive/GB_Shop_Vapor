//
//  RegisterRequest.swift
//  
//
//  Created by Vitaliy Talalay on 30.03.2022.
//

import Vapor

struct RegisterRequest: Content {
    var id_user: Int
    var username: String
    var password: String
    var email: String
    var gender: String
    var credit_card: String
    var bio: String
}
