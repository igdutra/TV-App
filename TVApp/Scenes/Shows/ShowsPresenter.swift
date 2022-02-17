import Foundation

protocol ShowsPresenting: AnyObject {
    func presentShows(_ shows: Shows)
    func presetShowDetail(_ show: Show)
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
    
    func presetShowDetail(_ show: Show) {
        coordinator.perform(action: .showDetail(show))
    }
}
