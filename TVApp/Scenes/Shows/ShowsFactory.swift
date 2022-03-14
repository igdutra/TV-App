import UIKit

enum ShowsFactory {
    static func make() -> UIViewController {
        // NOTE: Identify the type speeds up the Compilation Time
        let coordinator: ShowsCoordinatorProtocol = ShowsCoordinator()
        let service: ShowsServiceProtocol = ShowsService()
        let viewController = ShowsViewController()
        let viewModel: ShowsViewModelProtocol = ShowsViewModel(coordinator: coordinator,
                                                               service: service,
                                                               delegate: viewController)
        
        viewController.viewModel = viewModel
        coordinator.viewController = viewController

        return viewController
    }
}
