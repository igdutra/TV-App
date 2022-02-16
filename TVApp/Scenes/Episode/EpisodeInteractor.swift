import Foundation

protocol EpisodeInteracting: AnyObject {
    func setup()
}

final class EpisodeInteractor {
    private let service: EpisodeServicing
    private let presenter: EpisodePresenting
    private var episode: EpisodeResponse?

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
            case .success(let episode):
                self?.episode = episode
                self?.presenter.presentEpisode(episode)
            case .failure(let apiError):
                // Here the error can be handled (client, server, ...)
                print(apiError)
            }
        }
    }
}
