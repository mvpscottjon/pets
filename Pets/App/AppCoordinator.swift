//
//  AppCoordinator.swift
//  Pets
//
//  Created by Seven on 2022/7/14.
//

import Foundation
import RxSwift

final class AppCoordinator: Coordinator<Void> {
    
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        runMainFlow(window: window)
        return .empty()
    }

    func runMainFlow(window: UIWindow) {
        let coordinator = MainCoordinator(window: window)
        self.coordinator(to: coordinator).subscribe().disposed(by: bag)
    }
}
