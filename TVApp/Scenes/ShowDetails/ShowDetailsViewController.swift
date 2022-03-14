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
}

// MARK: - ViewConfiguration
extension ShowDetailsViewController: ViewConfiguration {
    func setupHierarchy() {
        view.addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.edgesToSuperView(toSafeArea: true)
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
        // TODO: add missing labels and image from viewModel
        title = showDetails.name
    }
}

// MARK: - TableViewDelegate
extension ShowDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Go to Episode Detail
    }
}
