import Foundation

enum APIRouter {
    case getCurrentWeather(location: Location)

    var host: String {
        switch self {
        case .getCurrentWeather:
            return "api.weatherapi.com"
        }
    }

    var scheme: String {
        switch self {
        case .getCurrentWeather:
            return "http"
        }
    }

    var path: String {
        switch self {
        case .getCurrentWeather:
            return "/v1/current.json"
        }
    }

    var method: String {
        switch self {
        case .getCurrentWeather:
            return "GET"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getCurrentWeather(let location):
            return [URLQueryItem(
                name: "q",
                value: "\(location.latitude),\(location.longitude)"
            )]
        }
    }

    var isNeedAuth: Bool {
        switch self {
        case .getCurrentWeather:
            return true
        }
    }
}
