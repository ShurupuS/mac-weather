import Network

class NetworkMonitor {

    // MARK: - Properties

    var onConnectionRestore: (() -> Void)?
    var onConnectionLost: (() -> Void)?

    private let monitor = NWPathMonitor()
    private var isConnected = false

    // MARK: - Public

    func start() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self else { return }
            switch path.status {
            case .satisfied:
                guard !isConnected else { return }

                self.isConnected.toggle()
                self.onConnectionRestore?()
            case .unsatisfied, .requiresConnection:
                guard isConnected else { return }

                self.isConnected.toggle()
                self.onConnectionLost?()
            @unknown default:
                break
            }
        }
        monitor.start(queue: .main)
    }

    func stop() {
        monitor.cancel()
    }
}
