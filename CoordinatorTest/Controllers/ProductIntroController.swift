//
//  ProductIntroController.swift
//  CoordinatorTest
//
//  Created by Andriy Stefanchuk on 09.12.2019.
//  Copyright © 2019 UCUTalk. All rights reserved.
//

import UIKit

protocol ProductIntroControllerDelegate: class {
    func proceed()
}

class ProductIntroController: UIViewController {

    weak var delegate: ProductIntroControllerDelegate?

    func proceed() {
        delegate?.proceed()
    }
}
