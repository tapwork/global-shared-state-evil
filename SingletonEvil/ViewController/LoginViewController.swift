//
//  LoginViewController.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: Properties
    private let controller: LoginModelController

    init(controller: LoginModelController) {
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Life Cycle
    override func loadView() {
        let loginview = LoginView()
        loginview.johnLoginButton.addTarget(self, action: #selector(login(_ :)), for: .touchUpInside)
        loginview.brooksLoginButton.addTarget(self, action: #selector(login(_ :)), for: .touchUpInside)
        view = loginview
        view.backgroundColor = .darkGray
    }

    // MARK: Actions
    @objc func login(_ button: LoginView.LoginButton) {
        controller.login(button.username)
    }
}
