//
//  SettingsFlowCoordinator.swift
//  CoordinatorTest
//
//  Created by Andriy Stefanchuk on 08.12.2019.
//  Copyright © 2019 UCUTalk. All rights reserved.
//

import UIKit

class SettingsFlowCoordinator: Coordinator {

    // MARK: - Properties

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mainViewController = HomeViewController()
        //mainViewController.coordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
}
