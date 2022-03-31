//
//  RegisterResponse.swift
//  
//
//  Created by Vitaliy Talalay on 30.03.2022.
//

import Vapor

struct AuthResponse: Content {
    var result: Int
    var user_message: String?
    var error_message: String?
}
