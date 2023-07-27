import SwiftUI

class ViewModelFactory {

    // MARK: - Properties

    private lazy var apiClient = APIClient()
    private lazy var networkMonitor = NetworkMonitor()
    private lazy var weatherService = WeatherServiceImpl(
        apiClient: apiClient
    )

    // MARK: - Factory

    func makeVaneViewModel() -> VaneViewModel {
        VaneViewModel(
            weatherService: weatherService,
            networkMonitor: networkMonitor
        )
    }

}
