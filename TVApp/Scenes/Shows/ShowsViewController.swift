import UIKit
import ChainedConstraints

protocol ShowsDisplaying: AnyObject {
    func display(shows: Shows)
}

final class ShowsViewController: UIViewController {
    // MARK: - Properties
    
    private let interactor: ShowsInteracting
    private lazy var tableViewDataSource: EpisodeDataSource = .init()
    
    private enum Constants {
        // Improvement: move title to .strings file in order to localize
        static let title = "TV Shows"
    }
        
    // MARK: - UI Elements
    
    init(interactor: ShowsInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.setup()
    }
}

// MARK: - ShowsDisplaying
extension ShowsViewController: ShowsDisplaying {
    func display(shows: Shows) {
        // Template
    }
}
