import Foundation

protocol ShowDetailsPresenting: AnyObject {
    func presentShowDetails(_ show: Show)
    func presentShowEpisodes(_ episodes: Episodes)
}

final class ShowDetailsPresenter {
    private let coordinator: ShowDetailsCoordinating
    weak var viewController: ShowDetailsDisplaying?

    init(coordinator: ShowDetailsCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: - ShowDetailsPresenting
extension ShowDetailsPresenter: ShowDetailsPresenting {
    func presentShowDetails(_ show: Show) {
        let viewModel = ShowDetailsViewModel(from: show)
        viewController?.display(showDetails: viewModel)
    }
    
    func presentShowEpisodes(_ episodes: Episodes) {
        
    }
}
