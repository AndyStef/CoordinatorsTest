//
//  HomeCoordinator.swift
//  CoordinatorTest
//
//  Created by Andriy Stefanchuk on 08.12.2019.
//  Copyright © 2019 UCUTalk. All rights reserved.
//

import UIKit

protocol HomeCoordinatorProtocol: class {
    func startSettingsFlow()
    func startNewProductFlow()
}

class HomeCoordinator: Coordinator {

    // MARK: - Properties

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mainViewController = HomeViewController()
        mainViewController.coordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func startSettingsFlow() {
        let settingsFlowCoordinator = SettingsFlowCoordinator(navigationController: navigationController)
        childCoordinators.append(settingsFlowCoordinator)
        settingsFlowCoordinator.start()
    }

    func startNewProductFlow() {
        let productCreationCoordinator = ProductCreationCoordinator(navigationController: navigationController)
        childCoordinators.append(productCreationCoordinator)
        productCreationCoordinator.start()
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    func showSettings() {
        let settingsFlowCoordinator = SettingsFlowCoordinator(navigationController: navigationController)
        childCoordinators.append(settingsFlowCoordinator)
        settingsFlowCoordinator.start()
    }

    func showProductCreation() {
        let productCreationCoordinator = ProductCreationCoordinator(navigationController: navigationController)
        productCreationCoordinator.delegate = self
        childCoordinators.append(productCreationCoordinator)
        productCreationCoordinator.start()
    }
}

extension HomeCoordinator: ProductCreationCoordinatorDelegate {
    func finishFlow(coordinator: ProductCreationCoordinator, with product: Product) {
        removeCoordinator(coordinator)
        // do sth with product
    }
}
