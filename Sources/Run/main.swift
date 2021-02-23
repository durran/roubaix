import App
import MongoSwift
import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)

defer {
    try? app.mongoClient.syncClose()
    cleanupMongoSwift()
    app.shutdown()
}

try configure(app)
try app.run()
