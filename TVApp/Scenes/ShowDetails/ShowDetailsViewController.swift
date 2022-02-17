import UIKit
import ChainedConstraints

protocol ShowDetailsDisplaying: AnyObject {
    func display(showDetails: ShowDetailsViewModel)
}

final class ShowDetailsViewController: UIViewController {
    // MARK: - Properties
    
    private let interactor: ShowDetailsInteracting
    private lazy var tableViewDataSource: ShowDetailsDataSource = .init()
    
    // MARK: - UI Elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    // MARK: - Init
    
    init(interactor: ShowDetailsInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
        interactor.setup()
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
extension ShowDetailsViewController: ShowDetailsDisplaying {
    func display(showDetails: ShowDetailsViewModel) {
        // TODO: add missing labels and image from viewModel
        title = showDetails.name
    }
}

// MARK: - TableViewDelegate
extension ShowDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teste = "S\(indexPath.section + 1) E\(indexPath.row + 1)"
        print(teste)
    }
}
