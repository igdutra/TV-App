import Foundation

protocol ShowsInteracting: AnyObject {
    func setup()
}

final class ShowsInteractor {
    private let service: ShowsServicing
    private let presenter: ShowsPresenting

    init(service: ShowsServicing, presenter: ShowsPresenting) {
        self.service = service
        self.presenter = presenter
    }
}

// MARK: - ShowsInteracting
extension ShowsInteractor: ShowsInteracting {
    func setup() {
        // Template
    }
}
