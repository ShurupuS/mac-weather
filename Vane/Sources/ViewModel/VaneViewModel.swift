import SwiftUI

class VaneViewModel: ObservableObject {

    // MARK: - Properties

    @Published var currentNumber: String = "1"

    private let weatherService: WeatherService

    // MARK: - Lifecycle

    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }

    // MARK: - Public

    func loadWeather() async {
        do {
            let weather = try await weatherService.getCurrentWeather(
                for: Location(latitude: 20.0, longitude: 20.0)
            )
            print(weather)
        }
        catch {
            print("error")
        }
    }

}
