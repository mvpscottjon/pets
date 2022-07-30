//
//  WispererAPIRequest.swift
//  Pets
//
//  Created by Seven on 2022/7/30.
//

import Foundation
import Alamofire

struct WispererAPIRequest: APIRequest {
    
    typealias Response = [Wisperer]

    var path: String { "/od/data/api/EA28418E-8956-4790-BAF4-C2D3988266CC?$format=json" }
    var baseURL: String { "https://od.moi.gov.tw" }
    var method: HTTPMethod { .get }
}
