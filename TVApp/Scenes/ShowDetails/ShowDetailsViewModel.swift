//
//  ShowsViewModel.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/03/22.
//

import Foundation

protocol ShowDetailsViewModelProtocol {
    var episodes: Episodes { get set }
    var delegate: ShowDetailsViewControllerProtocol? { get set }
}

class ShowDetailsViewModel {
    private let currentShow: Show
    private let coordinator: ShowDetailsCoordinatorProtocol
    private let service: ShowEpisodesServiceProtocol
    public weak var delegate: ShowDetailsViewControllerProtocol?
    public var episodes: Episodes
    
    init(currentShow: Show,
         coordinator: ShowDetailsCoordinatorProtocol,
         service: ShowEpisodesServiceProtocol,
         delegate: ShowDetailsViewControllerProtocol) {
        self.episodes = []
        self.currentShow = currentShow
        self.coordinator = coordinator
        self.service = service
        self.delegate = delegate
        
        setup()
    }
}

// MARK: - ShowsViewModelProtocol
extension ShowDetailsViewModel: ShowDetailsViewModelProtocol {
    // Template
}

// MARK: - Private Methods
private extension ShowDetailsViewModel {
    func setup() {
        let details = ShowDetails(from: currentShow)
        delegate?.display(showDetails: details)
        getEpisodes()
    }
    
    func getEpisodes() {
        service.getEpisodes(showId: currentShow.id) { [weak self] result in
            switch result {
            case .success(let episodes):
                self?.delegate?.display(episodes: episodes)
            case .failure(let apiError):
                // Improvement: Error can be handled, a dialog displayed, etc
                print(apiError)
            }
        }
    }
}
