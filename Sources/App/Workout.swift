import Foundation
import Vapor
import MongoSwift

struct Workout: Content {
    let _id: BSONObjectID
    let name: String
    let intervals: [Interval]
}
