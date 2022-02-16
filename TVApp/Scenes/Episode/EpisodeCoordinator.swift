import UIKit

enum EpisodeAction {
    // Template
}

protocol EpisodeCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: EpisodeAction)
}

final class EpisodeCoordinator {
    weak var viewController: UIViewController?
}

// MARK: - EpisodeCoordinating
extension EpisodeCoordinator: EpisodeCoordinating {
    func perform(action: EpisodeAction) {
        // Template
    }
}
