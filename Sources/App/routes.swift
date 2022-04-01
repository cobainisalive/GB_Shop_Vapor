import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }

    try app.register(collection: TodoController())
    
    let authController = AuthController()
    
    app.post("register", use: authController.register)
    app.post("login", use: authController.login)
    app.post("logout", use: authController.logout)
    app.post("changeUserData", use: authController.changeUserData)
    
    let goodsController = GoodsController()
    
    app.post("getGoodsById", use: goodsController.getGoodByID)
    app.post("getGoodsCatalog", use: goodsController.getGoodsCatalog)
    
    let reviewController = ReviewController()
    
    app.post("addReview", use: reviewController.addReview)
    app.post("approveReview", use: reviewController.approveReview)
    app.post("removeReview", use: reviewController.removeReview)
    app.post("getReviewListById", use: reviewController.getReviewListById)
    
// MARK: Test request
    app.get("approveReview_test", use: reviewController.removeReview)
    
}
