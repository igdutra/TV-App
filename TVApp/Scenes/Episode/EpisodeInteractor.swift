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
        service.getEpisode { [weak self] result in
            switch result {
            case .success(let episodes):
                self?.presenter.presentEpisode(episodes)
            case .failure(let apiError):
                // Improvement: Error can be handled, a dialog displayed, etc
                print(apiError)
            }
        }
    }
}
