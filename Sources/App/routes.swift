import MongoSwift
import Vapor

func routes(_ app: Application) throws {
    let database = app.mongoClient.db("roubaix")
    let workoutsCollection = database.collection("workouts")
        
    app.get { req in
        req.redirect(to: "/workouts")
    }
    
    app.get("workouts") { req -> [Workout] in
        return [
            Workout(
                _id: BSONObjectID(),
                name: "Stomps",
                intervals: [
                ]
            ),
            Workout(
                _id: BSONObjectID(),
                name: "Sweet Spot",
                intervals: [
                ]
            )
        ]
    }
    
    app.get("workouts", ":id") { req -> Workout in
        return Workout(
            _id: BSONObjectID(),
            name: "Stomps",
            intervals: [
            ]
        )
    }
}
