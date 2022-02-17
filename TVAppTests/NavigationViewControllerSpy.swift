//
//  ViewControllerSpy.swift
//  TVAppTests
//
//  Created by Ivo Dutra on 17/02/22.
//

import UIKit

final class NavigationViewControllerSpy: UINavigationController {
    enum Messages: Equatable {
        case pushViewController
    }
    
    private(set) var sentMessages: [Messages] = []
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        sentMessages.append(.pushViewController)
    }
}
