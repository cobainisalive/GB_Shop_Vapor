//
//  AuthController.swift
//  
//
//  Created by Vitaliy Talalay on 30.03.2022.
//

import Vapor

class AuthController {
    
    private var GoodResponse = AuthResponse(result: 1,
                                    user_message: "",
                                    error_message: nil)
    private var BadResponse = AuthResponse(result: 0,
                                       user_message: nil,
                                       error_message: "")
    
    func register(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        BadResponse.error_message = "Ошибка регистрации"
        GoodResponse.user_message = "Регистрация прошла успешно!"
        
        guard let body = try? req.content.decode(RegisterRequest.self) else {
            return req.eventLoop.future(BadResponse)
//          throw Abort(.badRequest)
        }
        
        print(body)
        
        return req.eventLoop.future(GoodResponse)
    }
    
    func login(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        BadResponse.error_message = "Ошибка входа"
        GoodResponse.user_message = "Вход выполнен!"
        
        guard let body = try? req.content.decode(LoginRequest.self) else {
            return req.eventLoop.future(BadResponse)
        }
        
        guard body.username == "Somebody" && body.password == "Password" else {
            return req.eventLoop.future(BadResponse)
        }
        
        print(body)
        
        return req.eventLoop.future(GoodResponse)
    }
    
    func logout(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
       
        BadResponse.error_message = "Что-то пошло не так"
        GoodResponse.user_message = "Выход выполнен!"
        
        guard let body = try? req.content.decode(LogoutRequest.self) else {
            return req.eventLoop.future(BadResponse)
        }
        
        guard body.userID == 1 else {
            return req.eventLoop.future(BadResponse)
        }
        
        print(body)
        
        return req.eventLoop.future(GoodResponse)
        
    }
    
    func changeUserData(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        BadResponse.error_message = "Не удалось изменить данные"
        GoodResponse.user_message = "Данные успешно изменены!"
        
        guard let body = try? req.content.decode(ChangeUserDataRequest.self) else {
            return req.eventLoop.future(BadResponse)
        }
        
        print(body)
        
        return req.eventLoop.future(GoodResponse)
    }
}
