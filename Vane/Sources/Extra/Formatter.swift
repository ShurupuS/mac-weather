import Foundation

enum Formatter {
    static func formatCelsius(degrees: Double) -> String {
        let formatter = MeasurementFormatter()
        let measurement = Measurement(
            value: degrees,
            unit: UnitTemperature.celsius
        )
        return formatter.string(from: measurement)
    }
}
