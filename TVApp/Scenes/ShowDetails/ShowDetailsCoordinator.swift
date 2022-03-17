import UIKit

enum ShowDetailsAction: Equatable {
    case episode(_ episode: Episode)
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
        switch action {
        case .episode(let episode):
            let controller = EpisodeDetailsFactory.make(episode: episode)
            viewController?.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
