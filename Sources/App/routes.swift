import MongoSwift
import Vapor

func routes(_ app: Application) throws {
    let database = app.mongoClient.db("roubaix")
    let workoutsCollection = database.collection("workouts")
        
    app.get { req in
        return "It works!"
    }
    
    app.get("workouts") { req -> [Workout] in
        return [
            Workout(_id: BSONObjectID(), name: "Stomps"),
            Workout(_id: BSONObjectID(), name: "Sweet Spot")
        ]
    }
    
    app.get("workouts", ":id") { req -> Workout in
        return Workout(_id: BSONObjectID(), name: "Stomps")
    }
}
