//
//  AddToBasketRequest.swift
//  
//
//  Created by Vitaliy Talalay on 11.04.2022.
//

import Vapor

struct AddToBasketRequest: Content {
    var id_product: Int
    var quantity: Int
}
