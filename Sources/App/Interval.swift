import Foundation
import Vapor

enum IntervalType: String, Codable {
    case rampUp,
         rampDown,
         overUnder
}

struct Interval: Content {
    let name: String
    let over: Double
    let timeOver: Int?
    let under: Double
    let timeUnder: Int?
    let cadence: Int?
    let rampDuration: Int?
    let type: IntervalType
}
