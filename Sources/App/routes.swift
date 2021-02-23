import MongoSwift
import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: WorkoutsController())
    
    app.get { req in
        req.redirect(to: "/workouts")
    }
}
