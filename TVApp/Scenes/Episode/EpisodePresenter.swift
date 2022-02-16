import Foundation

protocol EpisodePresenting: AnyObject {
    var viewController: EpisodeDisplaying? { get set }
    func presentEpisode(_ episode: EpisodeResponse)
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
    func presentEpisode(_ episode: EpisodeResponse) {
        viewController?.display(episode: episode)
    }
    
    func didNextStep(action: EpisodeAction) {
        coordinator.perform(action: action)
    }
}
