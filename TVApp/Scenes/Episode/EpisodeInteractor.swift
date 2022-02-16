import Foundation

protocol EpisodeInteracting: AnyObject {
    func setup()
}

final class EpisodeInteractor {
    private let service: EpisodeServicing
    private let presenter: EpisodePresenting

    init(service: EpisodeServicing,
         presenter: EpisodePresenting) {
        self.service = service
        self.presenter = presenter
    }
}

// MARK: - EpisodeInteracting
extension EpisodeInteractor: EpisodeInteracting {
    func setup() {
        presenter.displaySomething()
    }
}
