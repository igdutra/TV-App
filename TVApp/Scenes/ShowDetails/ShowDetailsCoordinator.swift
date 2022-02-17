import UIKit

enum ShowDetailsAction {
    // Template
}

protocol ShowDetailsCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: ShowDetailsAction)
}

final class ShowDetailsCoordinator {
    weak var viewController: UIViewController?
}

// MARK: - EpisodeCoordinating
extension ShowDetailsCoordinator: ShowDetailsCoordinating {
    func perform(action: ShowDetailsAction) {
        // Template
    }
}
