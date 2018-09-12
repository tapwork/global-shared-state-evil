//
//  LoginCoordinator.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinating {

    let presenter: UIViewController
    private weak var loginViewController: LoginViewController?
    var completion: ((Result<User>) -> Void)?

    required init(presenter: UIViewController) {
        self.presenter = presenter
    }

    func start() {
        let controller = LoginModelController()
        let loginVC = LoginViewController(controller: controller)
        presenter.present(loginVC, animated: true, completion: nil)
        loginViewController = loginVC
        controller.updateHandler.append({ update in
            switch update {
            case .didLogin(let result):
                self.dismiss()
                self.completion?(result)
            }
        })
    }

    func dismiss() {
        loginViewController?.dismiss(animated: true, completion: nil)
    }
}
