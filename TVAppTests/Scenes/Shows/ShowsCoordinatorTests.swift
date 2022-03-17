//
//  ShowsCoordinatorTests.swift
//  TVAppTests
//
//  Created by Ivo Dutra on 17/02/22.
//

import XCTest
@testable import TVApp

final class ShowsCoordinatorTests: XCTestCase {
    private let navigationSpy = NavigationViewControllerSpy(rootViewController: UIViewController())
    
    private lazy var sut: ShowsCoordinatorProtocol = {
        let coordinator = ShowsCoordinator()
        coordinator.viewController = navigationSpy.topViewController
        return coordinator
    }()
    
    func testPerformAction_WhenActionIsShowDetail_ShouldPushController() {
        sut.perform(action: .showDetail(.fixture()))
        
        XCTAssertEqual(navigationSpy.sentMessages, [.pushViewController])
    }
}
