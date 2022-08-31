//
//  CommunicatorIntroSection.swift
//  Pets
//
//  Created by Seven on 2022/8/14.
//

import Foundation
import RxDataSources

struct CommunicatorIntro {
    let title: String
    let subtitle: String
}

struct Lesson {
    let title: String
    let name: String
}

enum CommunicatorIntroSectionItem {
    case introItem(intro: CommunicatorIntro)
    case lessonItem(lesson: Lesson)
}

enum CommunicatorIntroSectionModel {
    case intro(title: String, items: [CommunicatorIntroSectionItem])
    case lesson(title: String, items: [CommunicatorIntroSectionItem])
}

extension CommunicatorIntroSectionModel: SectionModelType {
    typealias Item = CommunicatorIntroSectionItem

    var items: [CommunicatorIntroSectionItem] {
        switch self {
        case .intro(title: _, let items):
            return items.map { $0 }
        case .lesson(title: _, let items):
            return items.map { $0 }
        }
    }
    
    init(original: CommunicatorIntroSectionModel, items: [CommunicatorIntroSectionItem]) {
        
        switch original {
        case .intro(title: let title, items: let items):
            self = .intro(title: title, items: items)
        case .lesson(title: let title, items: let items):
            self = .lesson(title: title, items: items)
        }
    }
}

extension CommunicatorIntroSectionModel {
    var title: String {
        switch self {
        case .intro(let title, _):
            return title
        case .lesson(let title, _):
            return title
        }
    }
}
