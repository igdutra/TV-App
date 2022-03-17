//
//  ShowDetailsViewModelTests.swift
//  TVAppTests
//
//  Created by Ivo Dutra on 16/03/22.
//

import XCTest
@testable import TVApp

// MARK: - CoordinatorSpy
private final class ShowDetailsCoordinatorSpy: ShowDetailsCoordinatorProtocol {
    enum Messages: Equatable {
        case performAction
    }
    
    var viewController: UIViewController?
    private(set) var sentMessages: [Messages] = []
    private(set) var action: ShowDetailsAction?
    
    func perform(action: ShowDetailsAction) {
        self.action = action
        sentMessages.append(.performAction)
    }
}

// MARK: - ServiceMock
private final class ShowEpisodesServiceMock: ShowEpisodesServiceProtocol {
    var getEpisodeResult: Result<Episodes, ApiError>?
    
    func getEpisodes(showId: Int, completion: @escaping (Result<Episodes, ApiError>) -> Void) {
        guard let result = getEpisodeResult else {
            return XCTFail("Expected result")
        }
        completion(result)
    }
}

// MARK: - ViewControllerSpy
private final class ShowDetailsViewControllerSpy: ShowDetailsViewControllerProtocol {
    enum Messages: Equatable {
        case displayShowDetails
        case displayEpisodes
    }
    
    private(set) var showDetails: ShowDetails?
    private(set) var episodes: Episodes?
    private(set) var sentMessages: [Messages] = []
    
    func display(showDetails: ShowDetails) {
        self.showDetails = showDetails
        sentMessages.append(.displayShowDetails)
    }
    
    func display(episodes: Episodes) {
        self.episodes = episodes
        sentMessages.append(.displayEpisodes)
    }
}

// MARK: - Tests
final class ShowDetailsViewModelTests: XCTestCase {
    private let coordinatorSpy = ShowDetailsCoordinatorSpy()
    private let serviceMock = ShowEpisodesServiceMock()
    private let viewControllerSpy = ShowDetailsViewControllerSpy()
   
    func testDidSelect_ShouldCallCoordinator() {
        let episode: Episode = .fixture()
        serviceMock.getEpisodeResult = .failure(.invalidURL)
        let sut = makeSUT()
       
        sut.didSelect(episode)
        
        XCTAssertEqual(coordinatorSpy.sentMessages, [.performAction])
        XCTAssertEqual(coordinatorSpy.action, .episode(episode))
    }
    
    func testSetup_WhenServiceIsSuccessful_ShouldCallDelegateAndService() {
        let details = ShowDetails(from: .fixture())
        let episodes: Episodes = [.fixture()]
        serviceMock.getEpisodeResult = .success(episodes)
        
        _ = makeSUT()
        
        XCTAssertEqual(viewControllerSpy.sentMessages, [.displayShowDetails,
                                                        .displayEpisodes])
        XCTAssertEqual(viewControllerSpy.showDetails, details)
        XCTAssertEqual(viewControllerSpy.episodes, [.fixture()])
    }
}

// MARK: - Private Extension
private extension ShowDetailsViewModelTests {
    func makeSUT() -> ShowDetailsViewModel {
        ShowDetailsViewModel(currentShow: .fixture(),
                             coordinator: coordinatorSpy,
                             service: serviceMock,
                             delegate: viewControllerSpy)
    }
}
