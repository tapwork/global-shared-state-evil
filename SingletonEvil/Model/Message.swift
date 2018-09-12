//
//  Message.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import Foundation

struct Message: CustomDebugStringConvertible, Hashable {
    var debugDescription: String {
        return "\nsender: \(sender)\nmessage: \(text)\n"
    }
    let sender: String
    let text: String
}
