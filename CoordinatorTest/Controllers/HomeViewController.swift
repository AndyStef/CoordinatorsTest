//
//  HomeViewController.swift
//  CoordinatorTest
//
//  Created by Andriy Stefanchuk on 08.12.2019.
//  Copyright © 2019 UCUTalk. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Navigation

    weak var coordinator: HomeCoordinatorProtocol?

    @objc func handleSettingRedirect() {
        coordinator?.startSettingsFlow()
    }

    @objc func handleProductCreationRedirect() {
        coordinator?.startNewProductFlow()
    }

    // MARK: - Other

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        addTransitionButtons()
    }

    private func addTransitionButtons() {
        let settingsButton = UIButton()
        settingsButton.setTitle("Go to settings", for: .normal)
        settingsButton.addTarget(self, action: #selector(handleSettingRedirect), for: .touchUpInside)

        view.addSubview(settingsButton)

        settingsButton.translatesAutoresizingMaskIntoConstraints = false

        settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        settingsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        let productCreationButton = UIButton()
        productCreationButton.setTitle("Go to product creation", for: .normal)
        productCreationButton.addTarget(self, action: #selector(handleProductCreationRedirect), for: .touchUpInside)

        view.addSubview(productCreationButton)

        productCreationButton.translatesAutoresizingMaskIntoConstraints = false

        productCreationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        productCreationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
    }
}
