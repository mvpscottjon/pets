//
//  RequestHeaders.swift
//  Pets
//
//  Created by Seven on 2022/7/25.
//

import Alamofire

enum RequestHeaders {
    static var `default`: HTTPHeaders {
        let header: [String: String] = [
            "Accept": "application/json",
            "Content-Type": "application/json;charset=utf-8"
        ]
        return HTTPHeaders(header)
    }
}
