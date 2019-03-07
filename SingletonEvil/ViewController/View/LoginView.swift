//
//  LoginView.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import UIKit

class LoginView: UIView {

    class LoginButton: UIButton {
        var username = ""
    }
    // MARK: Properties
    private let stackView = UIStackView()
    let johnLoginButton = LoginButton()
    let brooksLoginButton = LoginButton()

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
        stackView.spacing = 40
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    private func setupButtons() {
        johnLoginButton.setTitle("Login with John", for: .normal)
        johnLoginButton.username = "John"
        stackView.addArrangedSubview(johnLoginButton)

        brooksLoginButton.setTitle("Login with Brooks", for: .normal)
        brooksLoginButton.username = "Brooks"
        stackView.addArrangedSubview(brooksLoginButton)
    }
}
