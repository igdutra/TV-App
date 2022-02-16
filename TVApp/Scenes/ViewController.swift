//
//  ViewController.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        setup()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("transaction!")
        let service = EpisodeService()
        
        service.getEpisode { result in
            switch result {
            case .success(let episode):
                print(episode)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - ViewConfiguration
extension ViewController: ViewConfiguration {
    func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.edgesToSuperView(toSafeArea: true)
    }
    
    func setupConfigurations() {
    }
}
