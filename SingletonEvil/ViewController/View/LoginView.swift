//
//  LoginView.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import UIKit

class LoginView: UIView {

    // MARK: Properties
    private let stackView = UIStackView()
    let johnLoginButton = UIButton()
    let brooksLoginButton = UIButton()

    // MARK: Setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupButtons()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup
    private func setupStackView() {
        addSubview(stackView)
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    private func setupButtons() {
        johnLoginButton.setTitle("John", for: .normal)
        stackView.addArrangedSubview(johnLoginButton)

        brooksLoginButton.setTitle("Brooks", for: .normal)
        stackView.addArrangedSubview(brooksLoginButton)
    }
}
