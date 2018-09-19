//
//  Coordinator.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    func start()
}

public protocol Coordinated: class {
    weak var coordinationDelegate: CoordinationDelegate? { get set }
}

public protocol CoordinationDelegate: class {
    func coordinate(from source: Coordinated, to destination: UIViewController, identifier id: String?)
}
