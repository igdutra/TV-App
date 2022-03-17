//
//  EpisodeDetailsViewController.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/03/22.
//

import UIKit
import ChainedConstraints

protocol EpisodeDetailsViewControllerProtocol: AnyObject {
    // Template
}

final class EpisodeDetailsViewController: UIViewController {
    // MARK: - Properties
    
    var viewModel: EpisodeDetailsViewModelProtocol?
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
        view.backgroundColor = .red
        viewSetup()
    }
    
    override func viewDidLayoutSubviews() {
        // Header View Needs Constraints
        headerView.widthToSuperview()
    }
}

// MARK: - ViewConfiguration
extension EpisodeDetailsViewController: ViewConfiguration {
    func setupHierarchy() {
//        view.addSubviews([tableView])
    }
    
    func setupConstraints() {
//        tableView.edgesToSuperView()
    }
    
    func setupConfigurations() {
        tableView.delegate = self
        tableView.dataSource = tableViewDataSource
        tableView.register(cellClass: UITableViewCell.self)
        tableView.tableHeaderView = headerView
    }
}

// MARK: - ShowDetailsDisplaying
extension EpisodeDetailsViewController: EpisodeDetailsViewControllerProtocol {
    // Template
}

// MARK: - TableViewDelegate
extension EpisodeDetailsViewController: UITableViewDelegate {
    // Template
}
