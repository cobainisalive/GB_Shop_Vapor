//
//  GoodsController.swift
//  
//
//  Created by Vitaliy Talalay on 31.03.2022.
//

import Vapor

class GoodsController {
    
    private var BadResponseForGoods = GoodResponse(result: 0,
                                                   id_product: nil,
                                                   product_name: nil,
                                                   product_price: nil,
                                                   product_description: nil,
                                                   error_message: nil)
    private var BadResponseForCatalog = GoodsCatalogResponse(result: 0,
                                                             page_number: nil,
                                                             products: nil,
                                                             error_message: "Ошибка запроса каталога")
    private var GoodResponseForGoods = GoodResponse(result: 1,
                                                    id_product: 123,
                                                    product_name: "Ноутбук",
                                                    product_price: 45600,
                                                    product_description: "Мощный игровой ноутбук",
                                                    error_message: nil)
    
    private var GoodResponseForCatalog = GoodsCatalogResponse(result: 1,
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
            BadResponseForGoods.error_message = "Ошибка запроса товара"
            return req.eventLoop.future(BadResponseForGoods)
        }
        
        guard body.productId == 123 else {
            BadResponseForGoods.error_message = "Товара с таким ID не существует"
            return req.eventLoop.future(BadResponseForGoods)
        }
        
        print(body)
        
        return req.eventLoop.future(GoodResponseForGoods)
    }
    
    func getGoodsCatalog(_ req: Request) throws -> EventLoopFuture<GoodsCatalogResponse> {
        
        guard let body = try? req.content.decode(GoodsCatalogRequest.self) else {
            return req.eventLoop.future(BadResponseForCatalog)
        }
        
        print(body)
        
        return req.eventLoop.future(GoodResponseForCatalog)
    }
}
