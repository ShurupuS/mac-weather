enum WeatherMapper {
    static func extractCurrentWeather(
        from dto: WeatherDTO
    ) -> Weather {
        Weather(
            temperatureCelsius: dto.temperatureCelsius,
            temperatureFahrenheit: dto.temperatureFahrenheit
        )
    }
}
