//
//  NewsFeedVM.swift
//  Pets
//
//  Created by Seven on 2022/7/18.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa


struct NewsFeedVM {

    struct State {
        let feeds: Driver<[Feed]>
    }
    
    struct Event {
        
    }
    
    // MARK: - Properties
    
    let state: State
    
    private let event = Event()
    private let feedsRelay = BehaviorRelay<[Feed]>(value: [])
    
    init() {
        state = State(feeds: feedsRelay.asDriver())
    }
    
    func fetchFeeds() {
        feedsRelay.accept(mockFeeds())
    }
    
    private func mockFeeds() -> [Feed] {
        var mockFeeds = [Feed]()
        for i in 0...20 {
            let feed = Feed(title: "\(i)", content: "TEST\(i)", photos: [], tag: [], profileImage: nil)
            mockFeeds.append(feed)
        }
        return mockFeeds
    }
}
