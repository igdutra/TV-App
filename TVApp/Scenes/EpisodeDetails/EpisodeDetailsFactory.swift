import UIKit

enum EpisodeDetailsFactory {
    static func make(episode: Episode) -> UIViewController {
        let viewController = EpisodeDetailsViewController()
        let viewModel: EpisodeDetailsViewModelProtocol = EpisodeDetailsViewModel(episode: episode,
                                                                                 delegate: viewController)
        
        viewController.viewModel = viewModel
        
        return viewController
    }
}
