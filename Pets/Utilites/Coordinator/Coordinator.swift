//
//  Coordinator.swift
//  Pets
//
//  Created by Seven on 2022/7/14.
//

import Foundation
import RxSwift

class Coordinator<Result> {
    let bag = DisposeBag()
    
    private let identifier = UUID()
    private var childCoordinator = [UUID: Any]()
    
    private func store<T>(_ coordinator: Coordinator<T>) {
        childCoordinator[coordinator.identifier] = coordinator
    }
    
    private func free<T>(_ coordinator: Coordinator<T>) {
        childCoordinator[coordinator.identifier] = nil
        Logger.log("free coordinator: \(coordinator)")
    }
    
    func coordinator<T>(to coordinator: Coordinator<T>) -> Observable<T> {
        store(coordinator)
        return coordinator.start()
            .take(1)
            .do(onNext: { [weak self] _ in
                self?.free(coordinator)
            })
    }
    
    func start() -> Observable<Result> {
        fatalError("Start method should be implemented.")
    }
    
    func freeAll() {
        childCoordinator = [:]
    }
}
