import SwiftUI

@main
struct VaneApp: App {

    // MARK: - Properties

    let viewModelFactory = ViewModelFactory()

    // MARK: - Scene

    var body: some Scene {
        VaneScene(
            viewModel: viewModelFactory.makeVaneViewModel()
        )
        Window("Settings", id: "settings") {
            SettingsView()
        }
    }
}
