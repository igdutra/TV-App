//
//  EpisodeDetailsViewModel.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/03/22.
//

import Foundation

protocol EpisodeDetailsViewModelProtocol {
    var episode: Episode { get set }
    var delegate: EpisodeDetailsViewControllerProtocol? { get set }
}

class EpisodeDetailsViewModel {
    var episode: Episode
    public weak var delegate: EpisodeDetailsViewControllerProtocol?
    
    init(episode: Episode,
         delegate: EpisodeDetailsViewControllerProtocol) {
        self.episode = episode
        self.delegate = delegate
        
        setup()
    }
}

// MARK: - ShowsViewModelProtocol
extension EpisodeDetailsViewModel: EpisodeDetailsViewModelProtocol {
    // Template
}

// MARK: - Private Methods
private extension EpisodeDetailsViewModel {
    func setup() {
        let details = EpisodeDetails(from: episode)
        delegate?.display(episode: details)
    }
}
