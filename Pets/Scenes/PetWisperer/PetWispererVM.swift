//
//  PetWispererVM.swift
//  Pets
//
//  Created by Seven on 2022/7/24.
//

import Foundation
import Alamofire
import RxSwift

struct PetWispererVM {

    init() {
    test()
        
    }
    
    private func test()  {
        // APIRequest
        
        WispererAPIRequest().send(completion: { rs in
            switch rs {
            case .success(let res):
                Logger.log("res", res)
            case .failure(let error):
                Logger.log("error", error)
            }
        })
        
//        let req = WispererAPIRequest()
//        API.sendRequest(req, completion: { rs in
//            switch rs {
//            case .success(let res):
//                Logger.log("res")
//            case .failure(let error):
//                Logger.log("error")
//            }
//        })
        
        
//        let urlString = "https://od.moi.gov.tw/od/data/api/EA28418E-8956-4790-BAF4-C2D3988266CC?$format=json"
//        guard let url = URL(string: urlString) else { return .empty() }

        // normal
//        let request = AF.request(url, method: .get, parameters: nil).response { response in
//            switch response.result {
//            case .success(let data):
//                guard let data = data else { return }
//                let json = try? JSONSerialization.jsonObject(with: data)
//                DebugLogger.log(item: "SUCCESS", json)
//            case .failure(let error):
//                DebugLogger.log(item: "ERROR", error)
//            }
//        }
        
        // APIManager
//        APIManager.shared.call(endPointType: <#T##EndPointType#>, handler: <#T##((DataResponse<Decodable, AFError>) -> Void)##((DataResponse<Decodable, AFError>) -> Void)##(DataResponse<Decodable, AFError>) -> Void#>)
//        APIManager.shared.call(endPointType: EndPoint.getWisperer, handler: {  (rs: (AFDataResponse<Wisperer>) -> Void) in
//            
//        })

//        APIManager.shared.call(endPointType: EndPoint.getWisperer, handler: { (DataResponse<Wisperer, AFError>) -> Void in
//            
//        })
        
//        APIManager.shared.call(endPointType: EndPoint.getWisperer) {  (value: [Wisperer]?, error)  in
//
//            print("here:", value, error)
//        }
//
        // Worker
        
//        Worker.GetWisperer().request { rs in
////            DebugLogger.log(item: "看WORKER RS", rs)
//            switch rs.result {
//            case .success(let data):
//                Logger.log("SUCCESS:", data)
//            case .failure(let error):
//                Logger.log("FAILED:", error)
//            }
//        }
        
        
        
        // rx
        
        
//        Observable<[String: Any]>.create { observer in
//            DebugLogger.log(item: "有跑這ㄌㄧ")
//
//            let urlString = "https://od.moi.gov.tw/od/data/api/EA28418E-8956-4790-BAF4-C2D3988266CC?$format=json"
//            guard let url = URL(string: urlString) else { return observer as! Disposable }
//
//            let request = AF.request(url, method: .get, parameters: nil).response { response in
//                switch response.result {
//                case .success(let data):
//
//                    guard let data = data,
//                          let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
//                    else { return }
//
//                    observer.onNext(json)
//                    observer.onCompleted()
//                    DebugLogger.log(item: "SUCCESS", json)
//                case .failure(let error):
//                    DebugLogger.log(item: "ERROR", error)
//                    observer.onError(error)
//                }
//            }
//
//            return Disposables.create {
//                request.cancel()
//            }
//        }
        


        
        
        
//        AF.request(<#T##convertible: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Encodable?#>, encoder: <#T##ParameterEncoder#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>).response(completionHandler: <#T##(AFDataResponse<Data?>) -> Void#>)
        
//        API.GetWisperer().request(completion: { res in
//            switch res.result {
//            case .success(let data):
//                guard let data = data else { return }
//                let json = try? JSONSerialization.jsonObject(with: data)
//                DebugLogger.log(item: "SUCCESS", json)
//            case .failure(let error):
//                DebugLogger.log(item: "ERROR", error)
//            }
//
//        })
//
//            .request().response { res in
//            switch res.result {
//            case .success(let data):
//                guard let data = data else { return }
//                let json = try? JSONSerialization.jsonObject(with: data)
//                DebugLogger.log(item: "SUCCESS", json)
//            case .failure(let error):
//                DebugLogger.log(item: "ERROR", error)
//            }
//        }
    }
}
