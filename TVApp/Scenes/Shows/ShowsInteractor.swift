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
        service.getShows(page: 0) { [weak self] result in
            switch result {
            case .success(let shows):
                self?.presenter.presentShows(shows)
            case .failure(let apiError):
                // Improvement: Error can be handled, a dialog displayed, etc
                print(apiError)
            }
        }
    }
}
