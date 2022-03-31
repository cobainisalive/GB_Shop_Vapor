//
//  GoodsCatalogRequest.swift
//  
//
//  Created by Vitaliy Talalay on 31.03.2022.
//

import Vapor

struct GoodsCatalogRequest: Content {
    var pageNumber: Int
    var categoryId: Int
}
