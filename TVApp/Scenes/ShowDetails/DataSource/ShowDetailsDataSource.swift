//
//  ShowDetailsDataSource.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

import UIKit

class ShowDetailsDataSource: NSObject, UITableViewDataSource {
    private var data: [Int: Episodes] = [:]
    
    public func add(items: Episodes) {
        data = Dictionary(grouping: items) { $0.season }
    }
    
    private enum Constants {
        // Improvement: move strings to .strings file in order to localize
        static let season = "Season "
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // TableViewSection begins at 0 but TV Show Season begins at 1
        Constants.season + "\(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewSection begins at 0 but TV Show Season begins at 1
        data[section + 1]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TableViewSection begins at 0 but TV Show Season begins at 1
        guard let episode = data[indexPath.section + 1]?[safe: indexPath.row],
              let cell = tableView.dequeueReusableCell(cellClass: UITableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        // Improvement/TODO: create custom UITableViewCell and pass episode to it
        cell.textLabel?.text = episode.name
        
        return cell
    }
}
