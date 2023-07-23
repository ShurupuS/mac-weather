import SwiftUI

struct VaneScene: Scene {

    // MARK: - Properties

    @ObservedObject var viewModel: VaneViewModel

    // MARK: - Scene

    var body: some Scene {
        MenuBarExtra(
            viewModel.currentNumber,
            systemImage: "\(viewModel.currentNumber).circle"
        ) {
            Button("Load") {
                Task {
                    await viewModel.loadWeather()
                }
            }
            Button("One") {
                viewModel.currentNumber = "1"
            }
            Button("Two") {
                viewModel.currentNumber = "2"
            }
            Button("Three") {
                viewModel.currentNumber = "3"
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
    }
}
