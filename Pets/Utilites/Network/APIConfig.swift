//
//  APIConfig.swift
//  Pets
//
//  Created by Seven on 2022/7/25.
//

import Alamofire

enum APIConfig {
    static let baseURL = "https://od.moi.gov.tw"
}

enum APIVersion: String {
    case v1
}

enum APIRequestEncoding {
    case json
    case url
    
    func asParameterEncoding() -> ParameterEncoding {
        switch self {
        case .json:
            return JSONEncoding.default
        case .url:
            return URLEncoding.default
        }
    }
}
