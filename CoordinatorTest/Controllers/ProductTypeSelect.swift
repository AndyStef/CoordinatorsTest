//
//  ProductTypeSelect.swift
//  CoordinatorTest
//
//  Created by Andriy Stefanchuk on 09.12.2019.
//  Copyright © 2019 UCUTalk. All rights reserved.
//

import UIKit

protocol ProductTypeSelectControllerDelegate: class {
    func selectType(type: ProductType)
}

class ProductTypeSelectController: UIViewController {

    weak var delegate: ProductTypeSelectControllerDelegate?

    func proceed() {
        delegate?.selectType(type: .video)
    }
}
