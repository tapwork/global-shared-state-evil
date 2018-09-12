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
    private let controller = InboxModelController()
    var user: User? {
        didSet {
            controller.user = user
        }
    }
    private let inboxViewController: InboxViewController

    required init(presenter: UIViewController) {
        self.presenter = presenter
        inboxViewController = InboxViewController(controller: controller)
    }

    func start() {
        presenter.present(inboxViewController, animated: true, completion: nil)
    }

    func dismiss() {
        inboxViewController.dismiss(animated: true, completion: nil)
    }
}
