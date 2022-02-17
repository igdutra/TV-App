//
//  ShowDataSource.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

import UIKit

class ShowDataSource: NSObject, UITableViewDataSource {
    private var data: Shows = []
    
    public func add(items: Shows) {
        data.append(contentsOf: items)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let show = data[safe: indexPath.row],
              let cell = tableView.dequeueReusableCell(cellClass: ShowTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        cell.setup(title: show.name, imagePath: show.image.medium)
        
        return cell
    }
}

