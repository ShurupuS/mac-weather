import SwiftUI

protocol WeatherService {
    func getCurrentWeather(
        for location: Location
    ) async throws -> CurrentWeatherDTO
}

class WeatherServiceImpl: WeatherService {

    // MARK: - Properties

    private let apiClient: APIClient

    // MARK: - Lifecycle

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    // MARK: - Requests

    func getCurrentWeather(
        for location: Location
    ) async throws -> CurrentWeatherDTO {
        let response: CurrentWeatherDTO = try await apiClient.request(
            apiRouter: .getCurrentWeather(location: location)
        )
        return response
    }

}
