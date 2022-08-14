//
//  PetCommunicatorVM.swift
//  Pets
//
//  Created by Seven on 2022/7/24.
//

import Foundation
import RxSwift
import RxCocoa

struct PetCommunicatorVM {
    
    enum Section {
        case doctor([Doctor])
        case wisperer([Communicator])
    }
    
    struct State {
        let sections: Driver<[Section]>
    }
    
    struct Event {
        let doctorViewTapped = PublishRelay<Doctor>()
        let wisperViewTapped = PublishRelay<Doctor>()
    }
    
    // MARK: - Properties
    
    let state: State
    let event = Event()
    
    private let sections = BehaviorRelay<[Section]>(value: [])

    // MARK: - Initializers
    
    init() {
        self.state = State(sections: sections.asDriver())
        
        // mock data
        let doctorImageURL = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWS_XhkZQcIkI-XLMCpNZNk54m_Z5rPOEsAQ&usqp=CAU"
        let mockDoctors = ["1", "2", "3", "4", "5"].map {
            Doctor(name: $0, title: $0, skill: $0, language: $0, imagUrl: URL(string: doctorImageURL))
        }
        
        let wisperperURL = "https://yummytw.com/wp-content/uploads/20220511190123_26.jpeg"
        let mockWisperers = ["1", "2", "3", "4", "5"].map {
            Communicator(name: $0, title: $0, charge: $0, language: $0, imagUrl: URL(string: wisperperURL))
        }
        
        var mockSections = [Section.doctor(mockDoctors)]
        mockSections.append(Section.wisperer(mockWisperers))
        sections.accept(mockSections)
    }
    
    // MARK: Bindings
    
    private func bind() {
    }
}
