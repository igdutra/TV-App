import UIKit

enum EpisodeFactory {
    static func make() -> UIViewController {
        let service: EpisodeServicing = EpisodeService()
        let coordinator: EpisodeCoordinating = EpisodeCoordinator()
        let presenter: EpisodePresenting = EpisodePresenter(coordinator: coordinator)
        let interactor = EpisodeInteractor(service: service, presenter: presenter)
        let viewController = EpisodeViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
