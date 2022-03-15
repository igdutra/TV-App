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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
    }
    
    // UITableViewHeader dynamic height
    override func viewDidLayoutSubviews() {
        guard let headerView = tableView.tableHeaderView else { return }
        
        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height
            // Trigger new layout only when height changes
            tableView.tableHeaderView = headerView
        }
    }
}

// MARK: - ViewConfiguration
extension ShowDetailsViewController: ViewConfiguration {
    func setupHierarchy() {
        view.addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView
            .edgesToSuperView()
    }
    
    func setupConfigurations() {
        tableView.delegate = self
        tableView.dataSource = tableViewDataSource
        tableView.register(cellClass: UITableViewCell.self)
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
        tableView.tableHeaderView = ShowDetailsTableViewHeader(details: showDetails)
    }
}

// MARK: - TableViewDelegate
extension ShowDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Go to Episode Detail
    }
}
