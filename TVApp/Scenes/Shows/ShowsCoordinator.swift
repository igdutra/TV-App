import UIKit

enum ShowsAction {
    // Template
}

protocol ShowsCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: ShowsAction)
}

final class ShowsCoordinator {
    weak var viewController: UIViewController?
}

// MARK: - ShowsCoordinating
extension ShowsCoordinator: ShowsCoordinating {
    func perform(action: ShowsAction) {
        // Template
    }
}
