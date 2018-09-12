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
    private var loginCoordinator: LoginCoordinator?
    private var inboxCoordinator: InboxCoordinator?

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
        let loginCoordinator = LoginCoordinator(presenter: rootViewController)
        loginCoordinator.start()
        self.loginCoordinator = loginCoordinator
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
        let inboxCoordinator = InboxCoordinator(presenter: rootViewController, user: user)
        inboxCoordinator.start()
        self.inboxCoordinator = inboxCoordinator


        // Mock
        if user.name == "John" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                inboxCoordinator.dismiss()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.showInbox(for: Mock.user(for: "Brooks"))
                }
            }
        }
    }
}
