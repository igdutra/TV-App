//
//  EpisodeDataSource.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

import UIKit

class EpisodeDataSource: NSObject, UITableViewDataSource {
    private var data: [Int: Episodes] = [:]
    
    public func add(items: Episodes) {
        data = Dictionary(grouping: items) { $0.season }
        
        print(data)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Season \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section + 1]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let episode = data[indexPath.section + 1]?[safe: indexPath.row],
              let cell = tableView.dequeueReusableCell(cellClass: MyTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        cell.episode = episode
        cell.textLabel?.text = episode.name
        
        return cell
    }
}

class MyTableViewCell: UITableViewCell {
    var episode: EpisodeResponse?
}
