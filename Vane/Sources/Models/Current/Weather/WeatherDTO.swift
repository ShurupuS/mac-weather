import Foundation

struct WeatherDTO: Codable {

    // MARK: - Properties

    let temperatureCelsius: Double
    let temperatureFahrenheit: Double

    enum CodingKeys: String, CodingKey {
        case temperatureCelsius = "temp_c"
        case temperatureFahrenheit = "temp_f"
    }
}
