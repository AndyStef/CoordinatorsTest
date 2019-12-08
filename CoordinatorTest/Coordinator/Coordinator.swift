//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Andriy Stefanchuk on 08.12.2019.
//  Copyright © 2019 UCUTalk. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }

    func start()
}

extension Coordinator {
    func removeCoordinator(_ coordinator: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === coordinator }) else {
            return
        }

        childCoordinators.remove(at: index)
    }
}
