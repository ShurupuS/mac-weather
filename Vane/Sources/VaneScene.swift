import SwiftUI

struct VaneScene: Scene {

    // MARK: - Properties

    @State var currentNumber: String = "1"

    // MARK: - Scene

    var body: some Scene {
        MenuBarExtra(
            currentNumber,
            systemImage: "\(currentNumber).circle"
        ) {
            Button("One") {
                currentNumber = "1"
            }
            Button("Two") {
                currentNumber = "2"
            }
            Button("Three") {
                currentNumber = "3"
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
    }
}
