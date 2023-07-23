import SwiftUI

class VaneViewModel: ObservableObject {

    // MARK: - Properties

    @Published var currentNumber: String = "1"

    private let weatherService: WeatherService

    // MARK: - Lifecycle

    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }

}
