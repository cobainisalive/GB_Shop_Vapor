//
//  ReviewListByIdResponse.swift
//  
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import Vapor

struct ReviewListByIdResponse: Content {
    var result: Int
    var reviewList: [String]?
    var error_message: String?
}
