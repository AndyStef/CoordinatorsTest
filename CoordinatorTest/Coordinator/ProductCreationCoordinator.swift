//
//  ProductCreationCoordinator.swift
//  CoordinatorTest
//
//  Created by Andriy Stefanchuk on 08.12.2019.
//  Copyright © 2019 UCUTalk. All rights reserved.
//

import UIKit

enum ProductType {
    case video
    case audio
    case motion
}

class Product {
    let name: String
    let type: ProductType

    init(name: String, type: ProductType) {
        self.name = name
        self.type = type
    }
}

class ProductBuilder {

    private var name: String?
    private var productType: ProductType?

    func setName(name: String) {
        self.name = name
    }

    func setProductType(type: ProductType) {
        self.productType = type
    }

    func build() -> Product? {
        guard let name = name, let productType = productType else {
            return nil
        }

        return Product(name: name, type: productType)
    }
}

protocol ProductCreationCoordinatorDelegate: class {
    func finishFlow(coordinator: ProductCreationCoordinator, with product: Product)
}

class ProductCreationCoordinator: Coordinator {

    // MARK: - Properties

    weak var delegate: ProductCreationCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    private var productBuilder = ProductBuilder()

    func start() {
        let introController = ProductIntroController()
        introController.delegate = self
        navigationController.pushViewController(introController, animated: true)
    }
}

extension ProductCreationCoordinator: ProductIntroControllerDelegate {
    func proceed() {
        let nameController = ProductNameEnterController()
        nameController.delegate = self
        navigationController.pushViewController(nameController, animated: true)
    }
}

extension ProductCreationCoordinator: ProductNameEnterControllerDelegate {
    func enterName(name: String) {
        productBuilder.setName(name: name)
        let typeController = ProductTypeSelectController()
        typeController.delegate = self
        navigationController.pushViewController(typeController, animated: true)
    }
}

extension ProductCreationCoordinator: ProductTypeSelectControllerDelegate {
    func selectType(type: ProductType) {
        productBuilder.setProductType(type: type)
        guard let product = productBuilder.build() else {
            return
        }

        delegate?.finishFlow(coordinator: self, with: product)
    }
}
