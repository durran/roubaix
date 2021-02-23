import MongoSwift
import Vapor

extension Application {
    public var mongoClient: MongoClient {
        get {
            self.storage[MongoClientKey.self]!
        }
        set {
            self.storage[MongoClientKey.self] = newValue
        }
    }
    
    private struct MongoClientKey: StorageKey {
        typealias Value = MongoClient
    }
}

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    let client = try MongoClient(using: app.eventLoopGroup)
    app.mongoClient = client
    // register routes
    try routes(app)
}
