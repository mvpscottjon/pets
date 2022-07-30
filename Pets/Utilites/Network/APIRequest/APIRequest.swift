//
//  APIRequest.swift
//  Pets
//
//  Created by Seven on 2022/7/27.
//

import Foundation
import Alamofire

/// A protocol for all api request.
///
/// A request should conform to `APIRequest`, like below example:
///
/// ```
/// struct WispererAPIRequest: APIRequest {
///     typealias Response = [Wisperer]
///
///     var path: String { "/od/data/api/EA28418E-8956-4790-BAF4-C2D3988266CC?$format=json" }
///     var baseURL: String { "https://od.moi.gov.tw" }
///     var method: HTTPMethod { .get }
/// }
/// ```
///
/// And then could use `WispererAPIRequest().send()` for URLRequest.

protocol APIRequest {
    associatedtype Response
    
    var path: String { get }
    var method: HTTPMethod { get }
    var header: HTTPHeaders { get }
    var baseURL: String { get }
}

extension APIRequest {
    var header: HTTPHeaders { .default }
    var baseURL: String { APIConfig.baseURL }
}

extension APIRequest where Response: Decodable {
    func send(completion: @escaping (Result<Response, Error>) -> Void) {
        guard let url = URL(string: baseURL + path) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest.headers = header
        
        AF.request(urlRequest).responseDecodable(of: Response.self, completionHandler: { rs in
            switch rs.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

