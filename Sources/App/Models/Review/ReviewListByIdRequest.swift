//
//  ReviewListByIdRequest.swift
//  
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import Vapor

struct ReviewListByIdRequest: Content {
    var id_product: Int
}
