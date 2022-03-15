import UIKit
import ChainedConstraints

protocol ShowsViewControllerProtocol: AnyObject {
    func displayShows()
}

final class ShowsViewController: UIViewController {
    // MARK: - Properties
    
    var viewModel: ShowsViewModelProtocol?
    private lazy var tableViewDataSource: ShowDataSource = .init()
    
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
    
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        // Improvement: move strings to .strings file in order to localize
        search.searchBar.placeholder = "Search for your favorite show"
        return search
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
    }
}

// MARK: - ViewConfiguration
extension ShowsViewController: ViewConfiguration {
    func setupHierarchy() {
        // Set translatesAutoresizingMaskIntoConstraints automatically
        view.addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.edgesToSuperView(toSafeArea: true)
    }
    
    func setupConfigurations() {
        title = Constants.title
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = tableViewDataSource
        tableView.register(cellClass: ShowTableViewCell.self)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

// MARK: - ShowsDisplaying
extension ShowsViewController: ShowsViewControllerProtocol {    
    func displayShows() {
        guard let viewModel = viewModel else { return }
        tableViewDataSource.replaceItems(with: viewModel.shows)
        tableView.reloadData()
    }
}

// MARK: - TableViewDelegate
extension ShowsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ShowTableViewCell,
           let show = cell.show {
            viewModel?.didSelect(show)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        // 50 is an arbitrary choice to load itens before reaching the end
        let lastItem = viewModel.shows.count - 50
        if indexPath.row == lastItem {
            viewModel.getMoreShows()
        }
    }
}

// MARK: - UISearchResultsUpdating
extension ShowsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
              let viewModel = viewModel else { return }
        let filteredShows = viewModel.getFilteredShows(name: text, isEmpty: text.isEmpty)
        tableViewDataSource.replaceItems(with: filteredShows)
        tableView.reloadData()
    }
}
