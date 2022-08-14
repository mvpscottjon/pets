//
//  CommunicatorAPIRequestTests.swift
//  PetsTests
//
//  Created by Seven on 2022/7/30.
//

import XCTest
import OHHTTPStubs

@testable import Pets

class CommunicatorAPIRequestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        HTTPStubs.removeAllStubs()
        try super.tearDownWithError()
    }

    func test_request_success() throws {
        let expectation = expectation(description: "success test")

        stub(condition: { _ in true}, response: { _ in
            guard let file = OHPathForFile("Wisperer_Success.json", type(of: self)) else {
                preconditionFailure("no json")
            }
            return HTTPStubsResponse(fileAtPath: file, statusCode: 200, headers: nil)
        })
        
        let apiRequest = PetCommunicatorAPIRequest()
        var sut: PetCommunicatorAPIRequest.Response?
        
        apiRequest.send(completion: { rs in
            switch rs {
            case .success(let repsonse):
                sut = repsonse
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Fail at error:\(error)")
            }
        })
        
        waitForExpectations(timeout: 1.0)
        
        XCTAssertEqual(sut?.count, 23)
        XCTAssertEqual(sut?.first?.title, "單位")
        XCTAssertEqual(sut?.first?.language, "電 話")
    }
    
    func test_request_failed() throws {
        let expectation = expectation(description: "Failed test")
        var responseError: Error?

        stub(condition: { _ in true}, response: { _ in
            let error = NSError(domain: NSURLErrorDomain, code: 500, userInfo: ["describe": "network error!!"])
            return HTTPStubsResponse(error: error)
        })
        
        let apiRequest = PetCommunicatorAPIRequest()
        
        apiRequest.send(completion: { rs in
            switch rs {
            case .success(_):
                XCTFail("Should not success")
            case .failure(let error):
                expectation.fulfill()
                responseError = error
            }
        })

        waitForExpectations(timeout: 1.0)
        
        XCTAssertNotNil(responseError)
    }
}
