//
//  GoodsController.swift
//  
//
//  Created by Vitaliy Talalay on 31.03.2022.
//

import Vapor

class GoodsController {
    
    private var badResponseForGoods = GoodResponse(result: 0,
                                                   id_product: nil,
                                                   product_name: nil,
                                                   product_price: nil,
                                                   product_description: nil,
                                                   error_message: nil)
    private var badResponseForCatalog = GoodsCatalogResponse(result: 0,
                                                             page_number: nil,
                                                             products: nil,
                                                             error_message: "Ошибка запроса каталога")
    private var goodResponseForGoods = GoodResponse(result: 1,
                                                    id_product: 123,
                                                    product_name: "Ноутбук",
                                                    product_price: 45600,
                                                    product_description: "Мощный игровой ноутбук",
                                                    error_message: nil)
    
    private var goodResponseForCatalog = GoodsCatalogResponse(result: 1,
                                                              page_number: 1,
                                                              products: [
                                                              GoodResponse(result: nil,
                                                                           id_product: 123,
                                                                           product_name: "Ноутбук",
                                                                           product_price: 45600,
                                                                           product_description: nil,
                                                                           error_message: nil),
                                                              GoodResponse(result: nil,
                                                                           id_product: 456,
                                                                           product_name: "Мышка",
                                                                           product_price: 1000,
                                                                           product_description: nil,
                                                                          error_message: nil)
                                                              ],
                                                              error_message: nil)
    
    func getGoodByID(_ req: Request) throws -> EventLoopFuture<GoodResponse> {
        
        guard let body = try? req.content.decode(GoodRequest.self) else {
            badResponseForGoods.error_message = "Ошибка запроса товара"
            return req.eventLoop.future(badResponseForGoods)
        }
        
        guard body.productId == 123 else {
            badResponseForGoods.error_message = "Товара с таким ID не существует"
            return req.eventLoop.future(badResponseForGoods)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponseForGoods)
    }
    
    func getGoodsCatalog(_ req: Request) throws -> EventLoopFuture<GoodsCatalogResponse> {
        
        guard let body = try? req.content.decode(GoodsCatalogRequest.self) else {
            return req.eventLoop.future(badResponseForCatalog)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponseForCatalog)
    }
}
