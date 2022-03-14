//
//  ShowsViewModel.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/03/22.
//

import Foundation

protocol ShowsViewModelProtocol {
    var shows: Shows { get set }
    var delegate: ShowsViewControllerProtocol? { get set }
    func didSelect(_ show: Show)
    func getMoreShows()
}

class ShowsViewModel {
    private let coordinator: ShowsCoordinatorProtocol
    private let service: ShowsServiceProtocol
    public weak var delegate: ShowsViewControllerProtocol?
    public var shows: Shows
    public var currentPage: Int = 0
    
    init(coordinator: ShowsCoordinatorProtocol,
         service: ShowsServiceProtocol,
         delegate: ShowsViewControllerProtocol) {
        self.shows = []
        self.coordinator = coordinator
        self.service = service
        self.delegate = delegate
        
        getShows()
    }
}

// MARK: - ShowsViewModelProtocol
extension ShowsViewModel: ShowsViewModelProtocol {
    func getMoreShows() {
        currentPage += 1
        getShows()
    }
    
    func didSelect(_ show: Show) {
        coordinator.perform(action: .showDetail(show))
    }
}

// MARK: - Private Methods
private extension ShowsViewModel {
    func getShows() {
        service.getShows(page: currentPage) { [weak self] result in
            switch result {
            case .success(let shows):
                self?.shows.append(contentsOf: shows)
                self?.delegate?.displayShows()
            case .failure(let apiError):
                // Improvement: Error can be handled, a dialog displayed, etc
                print(apiError)
            }
        }
    }
}
