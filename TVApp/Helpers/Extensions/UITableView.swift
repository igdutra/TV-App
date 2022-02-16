//
//  UIImageView.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/02/22.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cellClass: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCell<T>(cellClass: T.Type, indexPath: IndexPath) -> T? {
         return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T
     }
}
