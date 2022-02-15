//
//  UIImageView.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/02/22.
//

import UIKit

// TODO: find a tv show placeholder image

extension UIImageView {
    func from(url: String, placeholder: UIImage? = nil) {
        image = placeholder
        guard let url = URL(string: url) else { return }
        let urlSession = URLSession.shared.dataTask(with: url,
                                                    completionHandler: { (data, _, error) -> Void in
            guard error == nil, let data = data, let myImage = UIImage(data: data) else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                UIView.transition(with: strongSelf,
                                  duration: 2,
                                  options: .transitionCrossDissolve,
                                  animations: { [weak self] in
                                    self?.image = myImage
                                  })
            }
        })
        urlSession.resume()
    }
}
