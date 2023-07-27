enum LocationMapper {
    static func extractLocation(
        from dto: LocationDTO
    ) -> Location {
        Location(
            name: dto.name,
            country: dto.country
        )
    }
}
