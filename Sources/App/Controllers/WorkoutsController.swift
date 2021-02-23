import MongoSwift
import Vapor

func getIdFilter(request: Request) throws -> BSONDocument {
    guard let id = request.parameters.get("id") else {
        throw Abort(.internalServerError, reason: "Request unexpectedly missing id parameter")
    }
    return ["_id": .string(id)]
}

struct WorkoutsController: RouteCollection {
    let collection: MongoCollection<Workout>
    
    init(app: Application) {
        let database = app.mongoClient.db("roubaix")
        collection = database.collection("workouts", withType: Workout.self)
    }
    
    func boot(routes: RoutesBuilder) throws {
        let workoutRoutes = routes.grouped("workouts")
        workoutRoutes.get(use: index)
        workoutRoutes.group(":id") { workoutRoute in
            workoutRoute.get(use: show)
        }
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Workout]> {
        collection.find().flatMap { cursor in
            cursor.toArray()
        }.hop(to: req.eventLoop)
    }
    
    func show(req: Request) throws -> EventLoopFuture<Workout> {
        return collection.findOne(try getIdFilter(request: req))
            .hop(to: req.eventLoop)
            .unwrap(or: Abort(.notFound, reason: "No workout found for id"))
    }
}
