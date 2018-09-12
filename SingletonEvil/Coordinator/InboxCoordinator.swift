//
//  InboxCoordinator.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import UIKit

class InboxCoordinator: Coordinating {

    let presenter: UIViewController
    let user: User
    private weak var inboxViewController: InboxViewController?

    required init(presenter: UIViewController) {
        fatalError("please use init(presenter: UIViewController, user: User)")
    }

    required init(presenter: UIViewController, user: User) {
        self.presenter = presenter
        self.user = user
    }

    func start() {
        let controller = InboxModelController(user: user)
        let inboxVC = InboxViewController(controller: controller)
        presenter.present(inboxVC, animated: true, completion: nil)
        inboxViewController = inboxVC
    }

    func dismiss() {
        inboxViewController?.dismiss(animated: true, completion: nil)
    }
}
