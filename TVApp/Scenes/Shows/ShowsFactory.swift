import UIKit

enum ShowsFactory {
    static func make() -> UIViewController {
        let service: ShowsServicing = ShowsService()
        let coordinator: ShowsCoordinating = ShowsCoordinator()
        let presenter: ShowsPresenting = ShowsPresenter(coordinator: coordinator)
        let interactor = ShowsInteractor(service: service, presenter: presenter)
        let viewController = ShowsViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
