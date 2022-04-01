//
//  AuthController.swift
//  
//
//  Created by Vitaliy Talalay on 30.03.2022.
//

import Vapor

class AuthController {
    
    private var goodResponse = AuthResponse(result: 1,
                                    user_message: "",
                                    error_message: nil)
    private var badResponse = AuthResponse(result: 0,
                                       user_message: nil,
                                       error_message: "")
    
    func register(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        badResponse.error_message = "Ошибка регистрации"
        goodResponse.user_message = "Регистрация прошла успешно!"
        
        guard let body = try? req.content.decode(RegisterRequest.self) else {
            return req.eventLoop.future(badResponse)
//          throw Abort(.badRequest)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponse)
    }
    
    func login(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        badResponse.error_message = "Ошибка входа"
        goodResponse.user_message = "Вход выполнен!"
        
        guard let body = try? req.content.decode(LoginRequest.self) else {
            return req.eventLoop.future(badResponse)
        }
        
        guard body.username == "Somebody" && body.password == "Password" else {
            return req.eventLoop.future(badResponse)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponse)
    }
    
    func logout(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
       
        badResponse.error_message = "Что-то пошло не так"
        goodResponse.user_message = "Выход выполнен!"
        
        guard let body = try? req.content.decode(LogoutRequest.self) else {
            return req.eventLoop.future(badResponse)
        }
        
        guard body.userID == 1 else {
            return req.eventLoop.future(badResponse)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponse)
        
    }
    
    func changeUserData(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        badResponse.error_message = "Не удалось изменить данные"
        goodResponse.user_message = "Данные успешно изменены!"
        
        guard let body = try? req.content.decode(ChangeUserDataRequest.self) else {
            return req.eventLoop.future(badResponse)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponse)
    }
}
