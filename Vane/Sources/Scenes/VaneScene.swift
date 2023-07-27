import SwiftUI

struct VaneScene: Scene {

    // MARK: - Properties

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
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
    }
}
