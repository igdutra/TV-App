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
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    // MARK: - Init
    
    init(interactor: ShowsInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        interactor.setup()
    }
    // TODO: remove
    var shows = Shows()
}

// MARK: - ViewConfiguration
extension ShowsViewController: ViewConfiguration {
    func setupHierarchy() {
        view.addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.edgesToSuperView(toSafeArea: true)
    }
    
    func setupConfigurations() {
        title = Constants.title
        view.backgroundColor = .white
//        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellClass: ShowTableViewCell.self)
    }
}

// MARK: - ShowsDisplaying
extension ShowsViewController: ShowsDisplaying {
    func display(shows: Shows) {
        self.shows = shows
        tableView.reloadData()
    }
}

// MARK: - Table View
// Header, Footer, willDisplay, didSelectRowAt..
extension ShowsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let show = shows[safe: indexPath.row],
              let cell = tableView.dequeueReusableCell(cellClass: ShowTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        cell.setup(title: show.name, imagePath: show.image.medium)
        
        return cell
    }
}
