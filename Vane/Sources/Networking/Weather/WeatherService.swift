import SwiftUI

typealias CurrentConditions = (weather: Weather, location: Location)

protocol WeatherService {
    func getCurrent(
        for location: GPS
    ) async throws -> CurrentConditions
}

class WeatherServiceImpl: WeatherService {

    // MARK: - Properties

    private let apiClient: APIClient

    // MARK: - Lifecycle

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    // MARK: - Requests

    func getCurrent(
        for location: GPS
    ) async throws -> CurrentConditions {
        let response: CurrentDTO = try await apiClient.request(
            apiRouter: .getCurrent(location: location)
        )
        let weather = WeatherMapper.extractCurrentWeather(
            from: response.current
        )
        let location = LocationMapper.extractLocation(
            from: response.location
        )
        return (weather, location)
    }

}
