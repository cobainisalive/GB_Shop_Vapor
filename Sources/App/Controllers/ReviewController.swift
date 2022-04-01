//
//  ReviewController.swift
//  
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import Vapor

class ReviewController {
    
    private var goodResponse = AuthResponse(result: 1,
                                    user_message: "",
                                    error_message: nil)
    private var badResponse = AuthResponse(result: 0,
                                       user_message: nil,
                                       error_message: "")
    private var goodResponseForReviewList = ReviewListByIdResponse(result: 1,
                                                                   reviewList: ["Хороший товар",
                                                                                "Очень хороший товар",
                                                                                "Ну так, средненько"],
                                                                   error_message: nil)
    private var badResponseForReviewList = ReviewListByIdResponse(result: 0,
                                                                   reviewList: nil,
                                                                   error_message: "Не удалось загрузить список отзывов")
    
    func addReview(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        badResponse.error_message = "Ошибка добавления отзыва"
        goodResponse.user_message = "Ваш отзыв направлен на модерацию"
        
        guard let body = try? req.content.decode(AddReviewRequest.self) else {
            return req.eventLoop.future(badResponse)
        }
        
        guard body.text != "" else {
            return req.eventLoop.future(badResponse)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponse)
    }
    
    func approveReview(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        badResponse.error_message = "Ошибка одобрения отзыва"
        goodResponse.user_message = "Отзыв одобрен"
        
        guard let body = try? req.content.decode(ApproveReviewRequest.self) else {
            return req.eventLoop.future(badResponse)
        }
        
// MARK: TODO add request validity check
//        guard body.text != "" else {
//            return req.eventLoop.future(badResponse)
//        }
        
        print(body)
        
        return req.eventLoop.future(goodResponse)
    }
    
    func removeReview(_ req: Request) throws -> EventLoopFuture<AuthResponse> {
        
        badResponse.error_message = "Ошибка удаления отзыва"
        goodResponse.user_message = "Отзыв удален"
        
        guard let body = try? req.content.decode(RemoveReviewRequest.self) else {
            return req.eventLoop.future(badResponse)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponse)
    }
    
    func getReviewListById(_ req: Request) throws -> EventLoopFuture<ReviewListByIdResponse> {
        guard let body = try? req.content.decode(ReviewListByIdRequest.self) else {
            return req.eventLoop.future(badResponseForReviewList)
        }
        
        print(body)
        
        return req.eventLoop.future(goodResponseForReviewList)
    }
}
