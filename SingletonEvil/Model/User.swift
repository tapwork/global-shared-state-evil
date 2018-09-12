//
//  User.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import Foundation

struct User: CustomDebugStringConvertible {
    let name: String
    var debugDescription: String {
        return name
    }
}
