import Foundation
import Vapor

enum IntervalType: String, Codable {
    case rampUp,
         rampDown,
         overUnder,
         rest
}

struct Interval: Content {
    let name: String
    let over: Double?
    let timeOver: Int?
    let cadenceOver: Int?
    let under: Double?
    let timeUnder: Int?
    let cadenceUnder: Int?
    let cadence: Int?
    let duration: Int?
    let repetitions: Int?
    let rest: Double?
    let type: IntervalType
}
