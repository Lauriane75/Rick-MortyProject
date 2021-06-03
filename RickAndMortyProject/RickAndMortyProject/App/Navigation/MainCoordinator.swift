//
//  MainCoordinator.swift
//  RickAndMortyProject
//
//  Created by Lau on 28/05/2021.
//

import UIKit

protocol CoordinatorProtocol {
    func start()
}

class MainCoordinator: CoordinatorProtocol {
    
    // MARK: - Properties
    
    var window: UIWindow?
    
    fileprivate let navigationController = UINavigationController()
    
    private let screens: Screens
    
    private var homeViewCoordinator: HomeViewCoordinator
    
    // MARK: - Initializer
    
    init(window: UIWindow?, screens: Screens) {
        self.window = window
        self.screens = screens
        self.homeViewCoordinator = HomeViewCoordinator(screens: screens, navigationController: navigationController)
    }
    
    // MARK: - Start
    
    func start() {
        // to stop running while testing
        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }
        createNavigationController(navigationController: navigationController)
        homeViewCoordinator.start()
    }
    
    // MARK: - Private Functions
    
    private func createNavigationController(navigationController: UINavigationController) {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        let navBar = navigationController.navigationBar
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.tintColor = .white
    }
    
}


