import MapKit
import SwiftUI

struct SettingsView: View {

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: Constants.Geo.belgrade.latitude,
            longitude: Constants.Geo.belgrade.longitude
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5
        )
    )

    var body: some View {
        Map(
            coordinateRegion: $region,
            showsUserLocation: true
        )
    }
}
