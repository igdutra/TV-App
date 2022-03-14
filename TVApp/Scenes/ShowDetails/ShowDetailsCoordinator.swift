import UIKit

enum ShowDetailsAction {
    // Template
}

protocol ShowDetailsCoordinatorProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: ShowDetailsAction)
}

final class ShowDetailsCoordinator {
    weak var viewController: UIViewController?
}

// MARK: - EpisodeCoordinating
extension ShowDetailsCoordinator: ShowDetailsCoordinatorProtocol {
    func perform(action: ShowDetailsAction) {
        // Template
    }
}
