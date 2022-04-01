//
//  AddReviewRequest.swift
//  
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import Vapor

struct AddReviewRequest: Content {
    var id_user: Int
    var text: String
}
