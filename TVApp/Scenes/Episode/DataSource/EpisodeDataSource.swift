//
//  EpisodeDataSource.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

import UIKit

class EpisodeDataSource: NSObject, UITableViewDataSource {
    public var data: EpisodeResponse?
    // TODO: append items
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(cellClass: UITableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = data?.name
        return cell
    }
}
