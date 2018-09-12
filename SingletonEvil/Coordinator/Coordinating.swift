//
//  Coordinating.swift
//  SingletonEvil
//
//  Created by Christian Menschel on 07.09.18.
//  Copyright © 2018 sd. All rights reserved.
//

import UIKit

protocol Coordinating {
    associatedtype PresenterType: UIResponder
    var presenter: PresenterType { get }
    init(presenter: PresenterType)
    func start()
    func dismiss()
}
