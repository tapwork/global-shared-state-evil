//
//  AppCoordinator.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinating {
    let presenter: AppDelegate
    let rootCoordinator: RootCoordinator

    required init(presenter: AppDelegate) {
        self.presenter = presenter
        self.rootCoordinator = RootCoordinator(presenter: presenter.window!)
    }

    func start() {
        self.rootCoordinator.start()
    }

    func dismiss() {
        self.rootCoordinator.dismiss()
    }
}
