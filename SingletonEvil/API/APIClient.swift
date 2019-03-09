//
//  APIClient.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import Foundation

class APIClient {
    private let operationQueue = OperationQueue()

    func login(username: String, completion: @escaping (Result<User>) -> Void) {
        completion(.success(Mock.user(for: username)))
    }

    func fetchInbox(user: User, completion: @escaping (Result<Inbox>) -> Void) {
        let sleeptime: TimeInterval = (user.name == "John") ? 15 : 0.2
//        let sleeptime: TimeInterval = 0
        let messages = Mock.messages(for: user)
        operationQueue.addOperation {[weak self] in
            Thread.sleep(forTimeInterval: sleeptime)
            guard self != nil else { return }
            var inbox = Inbox(user: user)
            inbox.messsages = messages
            DispatchQueue.main.async {
                completion(.success(inbox))
            }
        }
    }
}
