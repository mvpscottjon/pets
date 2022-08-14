//
//  Communicator.swift
//  Pets
//
//  Created by Seven on 2022/7/26.
//

import Foundation

struct Communicator: Decodable {
    let name: String
    let title: String
    let charge: String
    let language: String
    var imagUrl: URL?
}
