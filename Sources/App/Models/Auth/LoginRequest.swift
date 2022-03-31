//
//  LoginRequest.swift
//  
//
//  Created by Vitaliy Talalay on 31.03.2022.
//

import Vapor

struct LoginRequest: Content {
    var username: String
    var password: String
}
