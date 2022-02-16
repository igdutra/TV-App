//
//  EpisodeDataSource.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

import UIKit

class EpisodeDataSource: NSObject, UITableViewDataSource {
    private var data: [EpisodeResponse] = []
    
    public func add(items: [EpisodeResponse]) {
        data.append(contentsOf: items)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = data[safe: indexPath.row],
              let cell = tableView.dequeueReusableCell(cellClass: UITableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = item.name
        
        return cell
    }
}
