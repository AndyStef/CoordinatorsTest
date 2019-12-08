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

extension UINavigationController {
    func viewController<T: UIViewController>(ofType type: T.Type) -> T? {
        guard let viewController = viewControllers.first(where: { $0 is T }),
            let typedViewController = viewController as? T else {
                return nil
        }

        return typedViewController
    }
}
