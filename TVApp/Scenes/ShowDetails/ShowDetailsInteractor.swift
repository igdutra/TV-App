import Foundation

protocol ShowDetailsInteracting: AnyObject {
    func setup()
}

final class ShowDetailsInteractor {
    private let service: ShowEpisodesServicing
    private let presenter: ShowDetailsPresenting
    private let show: Show

    init(show: Show,
         service: ShowEpisodesServicing,
         presenter: ShowDetailsPresenting) {
        self.show = show
        self.service = service
        self.presenter = presenter
    }
}

// MARK: - ShowDetailsInteracting
extension ShowDetailsInteractor: ShowDetailsInteracting {
    func setup() {
        presenter.presentShowDetails(show)
        service.getEpisodes(showId: show.id) { [weak self] result in
            switch result {
            case .success(let episodes):
                self?.presenter.presentShowEpisodes(episodes)
            case .failure(let apiError):
                // Improvement: Error can be handled, a dialog displayed, etc
                print(apiError)
            }
        }
    }
}
