//
//  ProductNameEnter.swift
//  CoordinatorTest
//
//  Created by Andriy Stefanchuk on 09.12.2019.
//  Copyright © 2019 UCUTalk. All rights reserved.
//

import UIKit

protocol ProductNameEnterControllerDelegate: class {
    func enterName(name: String)
}

class ProductNameEnterController: UIViewController {

    weak var delegate: ProductNameEnterControllerDelegate?

    func proceed() {
        delegate?.enterName(name: "Test name")
    }
}
