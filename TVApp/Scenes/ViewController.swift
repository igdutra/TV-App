//
//  ViewController.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/02/22.
//

import UIKit

class ViewController: UIViewController {
    private struct Constants {
        static let title = "Episodes"
    }
    
    // MARK: - Properties
    
    let cellId = "teste"
    
    // MARK: - UI Elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.rowHeight = UITableView.automaticDimension
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
        view.addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.edgesToSuperView(toSafeArea: true)
    }
    
    func setupConfigurations() {
        title = Constants.title
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellClass: UITableViewCell.self)
    }
}

// MARK: - Table View
// Header, Footer, willDisplay, didSelectRowAt..
extension ViewController: UITableViewDelegate { }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(cellClass: UITableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "test"
        return cell
    }
}
