import SwiftUI

class VaneViewModel: ObservableObject {

    // MARK: - Properties

    @Published var barString: String = ""

    private let weatherService: WeatherService

    private var timer: Timer?

    // MARK: - Lifecycle

    init(weatherService: WeatherService) {
        self.weatherService = weatherService

        Task {
            await loadWeather()
        }
        startTimer()
    }

    // MARK: - Public

    @MainActor
    func loadWeather() async {
        do {
            let weather = try await weatherService.getCurrentWeather(
                for: Constants.Geo.belgrade
            )
            barString = Formatter.formatCelsius(
                degrees: weather.current.temperatureCelsius
            )
        }
        catch {
            barString = "􀢤"
        }
    }

    // MARK: - Private

    private func startTimer() {
        timer = Timer
            .scheduledTimer(
                withTimeInterval: Constants.Timer.delay,
                repeats: true
            ) { _ in
                Task {
                    await self.loadWeather()
                }
            }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
