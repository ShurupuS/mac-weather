import Foundation

enum Constants {
    enum API {
        static let key = "42c8a3e1777746618be144957232307"
    }
    enum Geo {
        static let belgrade = GPS(
            latitude: 44.817778,
            longitude: 20.456944
        )
    }
    enum Timer {
        static let delay: TimeInterval = 60.0
    }
    enum String {
        static let noConnection = "􀢤"
    }
}
