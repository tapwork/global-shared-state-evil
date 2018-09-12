//
//  InboxModelController.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import Foundation

class InboxModelController {
    enum Update {
        case didLoad(Result<Inbox>)
    }

    // MARK: Properties
    var user: User?
    let api = APIClient()
    var updateHandler = [((Update) -> Void)]()
    var inbox: Inbox?

    // MARK: Actions
    func fetchInbox() {
        guard let user = user else { return }
        api.fetchInbox(user: user) { result in
            if case let .success(inbox) = result {
                self.inbox = inbox
            }
            self.updateHandler.forEach { handler in
                handler(.didLoad(result))
            }
        }
    }
}
