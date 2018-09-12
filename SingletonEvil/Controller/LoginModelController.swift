//
//  LoginModelController.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import Foundation

class LoginModelController {
    enum Update {
        case didLogin(Result<User>)
    }

    // MARK: Properties
    let api = APIClient()
    var updateHandler = [((Update) -> Void)]()


    // MARK: Actions
    func login(_ username: String) {
        api.login(username: username) {[weak self] result in
            guard let `self` = self else { return }
            self.updateHandler.forEach { handler in
                handler(.didLogin(result))
            }
        }
    }
}
