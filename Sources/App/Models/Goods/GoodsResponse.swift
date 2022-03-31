//
//  GoodsResponse.swift
//  
//
//  Created by Vitaliy Talalay on 31.03.2022.
//

import Vapor

struct GoodResponse: Content {
    var result: Int?
    var id_product: Int?
    var product_name: String?
    var product_price: Double?
    var product_description: String?
    var error_message: String?
}

struct GoodsCatalogResponse: Content {
    var result: Int?
    var page_number: Int?
    var products: [GoodResponse]?
    var error_message: String?
}
