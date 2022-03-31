//
//  LogoutRequest.swift
//  
//
//  Created by Vitaliy Talalay on 31.03.2022.
//

import Vapor

struct LogoutRequest: Content {
    var userID: Int
}
