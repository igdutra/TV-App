import UIKit

enum ShowDetailsFactory {
    static func make(show: Show) -> UIViewController {
        // NOTE: Identify the type speeds up the Compilation Time
        let coordinator: ShowDetailsCoordinatorProtocol = ShowDetailsCoordinator()
        let service: ShowEpisodesServiceProtocol = ShowEpisodesService()
        let viewController = ShowDetailsViewController()
        let viewModel: ShowDetailsViewModelProtocol = ShowDetailsViewModel(currentShow: show,
                                                                           coordinator: coordinator,
                                                                           service: service,
                                                                           delegate: viewController)
        
        viewController.viewModel = viewModel
        coordinator.viewController = viewController
        
        return viewController
    }
}
