//
//  RootCoordinator.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import UIKit

class RootCoordinator: Coordinating {
    let presenter: UIWindow
    private lazy var rootViewController = RootViewController()
    private lazy var loginCoordinator = LoginCoordinator(presenter: rootViewController)
    private lazy var inboxCoordinator = InboxCoordinator(presenter: rootViewController)

    required init(presenter: UIWindow) {
        self.presenter = presenter
    }

    func start() {
        presenter.rootViewController = rootViewController
        presenter.makeKeyAndVisible()

        DispatchQueue.main.async {
            self.showLogin()
        }
    }

    func dismiss() {
        presenter.rootViewController = nil
    }

    func showLogin() {
        loginCoordinator.start()
        loginCoordinator.completion = { result in
            switch result {
            case .success(let user):
                self.showInbox(for: user)
            default:
                break
            }
        }
    }

    func showInbox(for user: User) {
        inboxCoordinator.user = user
        inboxCoordinator.start()

        // Mock
        if user.name == "John" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.inboxCoordinator.dismiss()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.showLogin()
                }
            }
        }
    }
}
