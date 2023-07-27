import SwiftUI

class VaneViewModel: ObservableObject {

    // MARK: - Properties

    @Published var barString: String = ""

    private let weatherService: WeatherService
    private let networkMonitor: NetworkMonitor

    private var timer: Timer?

    // MARK: - Lifecycle

    init(
        weatherService: WeatherService,
        networkMonitor: NetworkMonitor
    ) {
        self.weatherService = weatherService
        self.networkMonitor = networkMonitor

        startTimer()
        startNetworkMonitor()
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
            barString = Constants.String.noConnection
        }
    }

    // MARK: - Private

    private func startTimer() {
        timer = Timer
            .scheduledTimer(
                withTimeInterval: Constants.Timer.delay,
                repeats: true
            ) { _ in
                Task { await self.loadWeather() }
            }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func startNetworkMonitor() {
        networkMonitor.onConnectionRestore = { [weak self] in
            guard let self else { return }

            Task { await self.loadWeather() }
            startTimer()
        }
        networkMonitor.onConnectionLost = { [weak self] in
            guard let self else { return }

            barString = Constants.String.noConnection
            stopTimer()
        }
        networkMonitor.start()
    }
}
