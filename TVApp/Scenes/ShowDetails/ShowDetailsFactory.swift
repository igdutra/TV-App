import UIKit

enum ShowDetailsFactory {
    static func make(show: Show) -> UIViewController {
        let service: ShowEpisodesServicing = ShowEpisodesService()
        let coordinator: ShowDetailsCoordinating = ShowDetailsCoordinator()
        let presenter = ShowDetailsPresenter(coordinator: coordinator)
        let interactor = ShowDetailsInteractor(show: show, service: service, presenter: presenter)
        let viewController = ShowDetailsViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
