import Foundation

protocol EpisodePresenting: AnyObject {
    var viewController: EpisodeDisplaying? { get set }
    func presentEpisode(_ episodes: Episodes)
    func didNextStep(action: EpisodeAction)
}

final class EpisodePresenter {
    private let coordinator: EpisodeCoordinating
    weak var viewController: EpisodeDisplaying?

    init(coordinator: EpisodeCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: - EpisodePresenting
extension EpisodePresenter: EpisodePresenting {
    func presentEpisode(_ episodes: Episodes) {
        viewController?.display(episodes: episodes)
    }
    
    func didNextStep(action: EpisodeAction) {
        coordinator.perform(action: action)
    }
}
