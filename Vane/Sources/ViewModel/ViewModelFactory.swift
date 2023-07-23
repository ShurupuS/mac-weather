import SwiftUI

class ViewModelFactory {

    // MARK: - Properties

    private let weatherService = WeatherService()

    // MARK: - Factory

    func makeVaneViewModel() -> VaneViewModel {
        VaneViewModel(weatherService: weatherService)
    }

}
