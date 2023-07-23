import Foundation

struct CurrentWeatherDTO: Codable {

    // MARK: - Properties

    let location: CurrentWeatherDTO.Location
    let current: CurrentWeatherDTO.Weather

    // MARK: - Nested Types

    struct Location: Codable {
        let name: String?
        let country: String
    }

    struct Weather: Codable {
        let temperatureCelsius: Double
        let temperatureFahrenheit: Double

        enum CodingKeys: String, CodingKey {
            case temperatureCelsius = "temp_c"
            case temperatureFahrenheit = "temp_f"
        }
    }
}
