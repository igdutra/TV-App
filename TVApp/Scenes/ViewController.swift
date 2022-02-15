//
//  ViewController.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/02/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        
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
