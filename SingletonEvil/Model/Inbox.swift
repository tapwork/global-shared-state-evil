//
//  Inbox.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import Foundation

struct Inbox {
    let user: User
    var messsages = [Message]()

    init(user: User) {
        self.user = user
    }
}
