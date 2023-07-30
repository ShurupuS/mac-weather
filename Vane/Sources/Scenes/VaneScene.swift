import SwiftUI

struct VaneScene: Scene {

    // MARK: - Properties

    @Environment(\.openWindow) var openWindow

    @ObservedObject var viewModel: VaneViewModel

    // MARK: - Lifecycle

    init(viewModel: VaneViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Scene

    var body: some Scene {
        MenuBarExtra(
            viewModel.barString
        ) {
            Button("Reload") {
                Task {
                    await viewModel.loadWeather()
                }
            }
            Button("Settings") {
                NSApplication.shared.activate(ignoringOtherApps: true)
                openWindow(id: "settings")
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
    }
}
