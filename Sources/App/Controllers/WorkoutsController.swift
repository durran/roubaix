import MongoSwift
import Vapor

struct WorkoutsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let workoutRoutes = routes.grouped("workouts")
        workoutRoutes.get(use: index)
        workoutRoutes.group(":id") { workoutRoute in
            workoutRoute.get(use: show)
        }
    }
    
    func index(req: Request) throws -> [Workout] {
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
    
    func show(req: Request) throws -> Workout {
        return Workout(
            _id: BSONObjectID(),
            name: "Stomps",
            intervals: [
            ]
        )
    }
}
