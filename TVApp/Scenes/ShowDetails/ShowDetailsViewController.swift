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
    
    private lazy var showImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
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
        view.addSubviews([showImageView, tableView])
    }
    
    func setupConstraints() {
        showImageView
            .centerHorizontalToSuperView()
            .heightTo(200)
            .topToSuperview(4, toSafeArea: true)
        
        tableView
            .edgesToSuperView(excluding: .top, toSafeArea: true)
            .topToBottom(of: showImageView, margin: 24)
    }
    
    func setupConfigurations() {
        tableView.delegate = self
        tableView.dataSource = tableViewDataSource
        tableView.register(cellClass: UITableViewCell.self)
        tableView.tableHeaderView = makeHeader()
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
        // Improvement: This asset image could be in an script generated file, e.g. using SwiftGen
        showImageView.from(url: showDetails.image, placeholder: UIImage(named: "imagePlaceholder"))
        
    }
}

// MARK: - TableViewDelegate
extension ShowDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Go to Episode Detail
    }
}

// MARK: - Private Methods
private extension ShowDetailsViewController {
    // Improvement: transform into component
    func makeHeader() -> UIView {
        let headerView: UIView = .init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let label: UILabel = .init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "Episodes"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.addSubview(label)
        headerView.backgroundColor = .white
        return headerView
    }
}
