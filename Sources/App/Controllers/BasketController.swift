//
//  BasketController.swift
//  
//
//  Created by Vitaliy Talalay on 11.04.2022.
//

import Vapor

class BasketController {
    private var goodResponse = AuthResponse(result: 1,
                                            user_message: "",
                                            error_message: nil)
    private var badResponse = AuthResponse(result: 0,
                                           user_message: nil,
                                           error_message: "")
    
    func addToBasket(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        guard let body = try? req.content.decode(GoodRequest.self) else {
            badResponse.error_message = "Ошибка добавления в корзину"
            return req.eventLoop.future(badResponse)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponse)
    }
    
    func removeFromBasket(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        guard let body = try? req.content.decode(GoodsCatalogRequest.self) else {
            badResponse.error_message = "Ошибка удаления из корзины"
            return req.eventLoop.future(badResponse)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponse)
    }
    
    func payBasket(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        guard let body = try? req.content.decode(GoodsCatalogRequest.self) else {
            badResponse.error_message = "Ошибка оплаты"
            return req.eventLoop.future(badResponse)
        }
        
        print(body)
        
        goodResponse.user_message = "Оплата прошла успешно"
        return req.eventLoop.future(goodResponse)
    }
}
