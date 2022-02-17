import UIKit
import ChainedConstraints

protocol EpisodeDisplaying: AnyObject {
    func display(episodes: Episodes)
}

final class EpisodeViewController: UIViewController {
    // MARK: - Properties
    
    private let interactor: EpisodeInteracting
    private lazy var tableViewDataSource: EpisodeDataSource = .init()
    
    private enum Constants {
        // Improvement: move title to .strings file in order to localize
        static let title = "Episodes"
    }
    
    // MARK: - UI Elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .blue
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    // MARK: - Init
    
    init(interactor: EpisodeInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        viewSetup()
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
    func display(episodes: Episodes) {
        tableViewDataSource.add(items: episodes)
        tableView.reloadData()
    }
}

// MARK: - TableViewDelegate
extension EpisodeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teste = "S\(indexPath.section + 1) E\(indexPath.row + 1)"
        print(teste)
    }
}
