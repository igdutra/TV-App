import UIKit
import ChainedConstraints

protocol ShowsDisplaying: AnyObject {
    func display(shows: Shows)
}

final class ShowsViewController: UIViewController {
    // MARK: - Properties
    
    private let interactor: ShowsInteracting
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
        tableView.delegate = self
        tableView.dataSource = tableViewDataSource
        tableView.register(cellClass: ShowTableViewCell.self)
    }
}

// MARK: - ShowsDisplaying
extension ShowsViewController: ShowsDisplaying {
    func display(shows: Shows) {
        tableViewDataSource.add(items: shows)
        tableView.reloadData()
    }
}

// MARK: - TableViewDelegate
extension ShowsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teste = "S\(indexPath.section + 1) E\(indexPath.row + 1)"
        print(teste)
    }
}
