import Foundation

struct CurrentDTO: Codable {

    // MARK: - Properties

    let location: LocationDTO
    let current: WeatherDTO
}
