//
//  Mock.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import Foundation

struct Mock {
    private static var mockMessages = ["John": [Message(sender: "Bank", text: "Dear John, Your Tan is T883874")],
                                "Brooks": [Message(sender: "John", text: "Hi Brooks, how are you?")]]

    static func user(for name: String) -> User {
        assert(name == "John" || name == "Brooks")
        return User(name: name)
    }

    static func messages(for user: User) -> [Message] {
        return mockMessages[user.name] ?? [Message(sender: "Some", text: "Empty")]
    }
}
