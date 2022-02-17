import UIKit

enum ShowsAction {
    case showDetail(Show)
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
        switch action {
        case .showDetail(let show):
            let detailController = ShowDetailsFactory.make(show: show)
            viewController?.navigationController?.pushViewController(detailController, animated: true)
        }
    }
}
