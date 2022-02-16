import UIKit

protocol EpisodeDisplaying: AnyObject {
    func display(episode: EpisodeResponse)
}

final class EpisodeViewController: UIViewController {
    // MARK: - Properties
    
    private let interactor: EpisodeInteracting
    private lazy var tableViewDataSource: EpisodeDataSource = .init()
    
    private struct Constants {
        static let title = "Episodes"
    }
    
    // MARK: - UI Elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    init(interactor: EpisodeInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setup()
        interactor.setup()
    }
}

// MARK: - ViewConfiguration
extension EpisodeViewController: ViewConfiguration {
    func setupHierarchy() {
        view.addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.edgesToSuperView(toSafeArea: true)
    }
    
    func setupConfigurations() {
        title = Constants.title
        tableView.delegate = self
        tableView.dataSource = tableViewDataSource
        tableView.register(cellClass: UITableViewCell.self)
    }
}

// MARK: - EpisodeDisplaying
extension EpisodeViewController: EpisodeDisplaying {
    func display(episode: EpisodeResponse) {
        tableViewDataSource.data = episode
        tableView.reloadData()
    }
}

// MARK: - Table View
// Header, Footer, willDisplay, didSelectRowAt..
extension EpisodeViewController: UITableViewDelegate { }

//extension EpisodeViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(cellClass: UITableViewCell.self, indexPath: indexPath) else {
//            return UITableViewCell()
//        }
//        cell.textLabel?.text = "test"
//        return cell
//    }
//}
