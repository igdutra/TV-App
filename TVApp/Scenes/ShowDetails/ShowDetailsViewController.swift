import UIKit
import ChainedConstraints

protocol ShowDetailsViewControllerProtocol: AnyObject {
    func display(showDetails: ShowDetails)
    func display(episodes: Episodes)
}

final class ShowDetailsViewController: UIViewController {
    // MARK: - Properties
    
    var viewModel: ShowDetailsViewModelProtocol?
    private lazy var tableViewDataSource: ShowDetailsDataSource = .init()
    
    // MARK: - UI Elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

    lazy var headerView: ShowDetailsTableViewHeader = .init()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
    }
    
    override func viewDidLayoutSubviews() {
        // Header View Needs Constraints
        headerView.widthToSuperview()
    }
}

// MARK: - ViewConfiguration
extension ShowDetailsViewController: ViewConfiguration {
    func setupHierarchy() {
        view.addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.edgesToSuperView()
    }
    
    func setupConfigurations() {
        tableView.delegate = self
        tableView.dataSource = tableViewDataSource
        tableView.register(cellClass: UITableViewCell.self)
        tableView.tableHeaderView = headerView
    }
}

// MARK: - ShowDetailsDisplaying
extension ShowDetailsViewController: ShowDetailsViewControllerProtocol {
    func display(episodes: Episodes) {
        tableViewDataSource.add(items: episodes)
        tableView.reloadData()
    }
    
    func display(showDetails: ShowDetails) {
        title = showDetails.name
        headerView.setup(with: showDetails)
    }
}

// MARK: - TableViewDelegate
extension ShowDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Go to Episode Detail
    }
}
