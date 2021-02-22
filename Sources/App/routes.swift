import MongoSwift
import Vapor

func routes(_ app: Application) throws {
    let database = app.mongoClient.db("roubaix")
    let workoutsCollection = database.collection("workouts")
        
    app.get { req in
        return "It works!"
    }
    
    app.get("workouts") { req -> String in
        return "Workouts"
    }
    
    app.get("workouts", ":id") { req -> String in
        return "workout"
    }
}
