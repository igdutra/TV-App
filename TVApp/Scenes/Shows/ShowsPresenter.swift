import Foundation

protocol ShowsPresenting: AnyObject {
    var viewController: ShowsDisplaying? { get set }
    func presentShows(_ shows: Shows)
    func didNextStep(action: ShowsAction)
}

final class ShowsPresenter {
    private let coordinator: ShowsCoordinating
    weak var viewController: ShowsDisplaying?

    init(coordinator: ShowsCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: - ShowsPresenting
extension ShowsPresenter: ShowsPresenting {
    func presentShows(_ shows: Shows) {
        viewController?.display(shows: shows)
    }
    
    func didNextStep(action: ShowsAction) {
        coordinator.perform(action: action)
    }
}
