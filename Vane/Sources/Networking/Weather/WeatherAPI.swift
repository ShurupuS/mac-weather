import Foundation

enum APIRouter {
    case getCurrent(location: GPS)

    var host: String {
        switch self {
        case .getCurrent:
            return "api.weatherapi.com"
        }
    }

    var scheme: String {
        switch self {
        case .getCurrent:
            return "http"
        }
    }

    var path: String {
        switch self {
        case .getCurrent:
            return "/v1/current.json"
        }
    }

    var method: String {
        switch self {
        case .getCurrent:
            return "GET"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getCurrent(let location):
            return [URLQueryItem(
                name: "q",
                value: "\(location.latitude),\(location.longitude)"
            )]
        }
    }

    var isNeedAuth: Bool {
        switch self {
        case .getCurrent:
            return true
        }
    }
}
