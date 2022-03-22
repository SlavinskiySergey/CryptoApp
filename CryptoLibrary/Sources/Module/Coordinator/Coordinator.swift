//
//  Coordinator.swift
//  CryptoApp
//

import Foundation

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    func start()
}

open class BaseCoordinator: Coordinator {
    public private(set) var childCoordinators: [Coordinator] = []
    
    public init() {}
    
    public final func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    public final func removeDependency(_ coordinator: Coordinator?) {
        guard !childCoordinators.isEmpty,
            let coordinator = coordinator else {
            return
        }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

    open func start() {}
}
