//
//  Helper.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
typealias JSON = [String: Any]

func run(after: TimeInterval, action: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + after, execute: action)
}
