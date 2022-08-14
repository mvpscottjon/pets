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
        case communicator([Communicator])
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
        
        // TODO: - update real data
        let mockSections = [Section.doctor(mockDoctors()), Section.communicator(mockCommunicators())]
        sections.accept(mockSections)
    }
    
    func mockDoctors() -> [Doctor] {
        let urls = [
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWS_XhkZQcIkI-XLMCpNZNk54m_Z5rPOEsAQ&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWS_XhkZQcIkI-XLMCpNZNk54m_Z5rPOEsAQ&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWS_XhkZQcIkI-XLMCpNZNk54m_Z5rPOEsAQ&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWS_XhkZQcIkI-XLMCpNZNk54m_Z5rPOEsAQ&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWS_XhkZQcIkI-XLMCpNZNk54m_Z5rPOEsAQ&usqp=CAU"
        ]
        let names = ["黑傑克", "華佗", "針灸師父", "賣藥郎中", "蒙古大夫"]
        let charges = [
            "家醫、皮膚、內分泌、內科",
            "狗狗家庭訓練、狗狗行為訓練",
            "小動物腫瘤學、小動物內科",
            "預防醫學、一班內科及外科、影像判讀",
            "臨床營養、寵物營養、動物營養"
        ]
        
        let titles = ["獸醫師、甲級寵物溝通師", "乙級寵物溝通師", "甲級寵物溝通師", "丙級寵物溝通師", "甲級寵物溝通師"]
        let languages = ["中文、英文", "中文", "泰文", "中文、英文", "日文"]
        

        
        let mockData = names.map { name -> Doctor in
            let title = titles[Int.random(in: 0...titles.count-1)]
            let skill = "專長：" + charges[Int.random(in: 0...charges.count-1)]
            let language = "諮詢語言：" + languages[Int.random(in: 0...languages.count-1)]
            let imageURLString = urls[Int.random(in: 0...urls.count-1)]
            let imageURL = URL(string: imageURLString)
            
            return Doctor(name: name, title: title, skill: skill, language: language, imageUrl: imageURL)
        }
        
        return mockData

    }
    
    func mockCommunicators() -> [Communicator] {
        let urls = [
            "https://yummytw.com/wp-content/uploads/20220511190123_26.jpeg",
            "https://yummytw.com/wp-content/uploads/20220511190123_26.jpeg",
            "https://yummytw.com/wp-content/uploads/20220511190123_26.jpeg",
            "https://yummytw.com/wp-content/uploads/20220511190123_26.jpeg",
            "https://yummytw.com/wp-content/uploads/20220511190123_26.jpeg"
        ]
        let names = ["溝通師1", "溝通師2", "溝通師3", "溝通師4", "溝通師5"]
        let charges = ["1000", "2000", "500", "300", "400"]
        let titles = ["獸醫師、甲級寵物溝通師", "乙級寵物溝通師", "甲級寵物溝通師", "丙級寵物溝通師", "甲級寵物溝通師"]
        let languages = ["中文、英文", "中文", "泰文", "中文、英文", "日文"]
        
        let mockData = names.map { name -> Communicator in
            let title = titles[Int.random(in: 0...titles.count-1)]
            let charge = "費用：" + charges[Int.random(in: 0...charges.count-1)]
            let language = "語言：" + languages[Int.random(in: 0...languages.count-1)]
            let imageURLString = urls[Int.random(in: 0...urls.count-1)]
            let imageURL = URL(string: imageURLString)
            
            return Communicator(name: name, title: title, charge: charge, language: language, imageUrl: imageURL)
        }
        
        return mockData
    }
}
