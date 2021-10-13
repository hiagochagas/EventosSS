//
//  APIRequesterTests.swift
//  EventosSSTests
//
//  Created by Hiago Chagas on 10/10/21.
//

import XCTest
@testable import EventosSS

class APIRequesterTests: XCTestCase {
    var sut: APIRequester?
    
    override func setUp() {
        sut = APIRequester.shared
    }
    
    func test_getEvents_shouldNotBeEmpty() {
        let promise = expectation(description: "The API is not empty")
        sut?.fetchAllEvents { events, error in
            if let error = error {
                XCTFail("An error of type \(error) occurred")
            }
            if let events = events {
                if events.count > 0 {
                    promise.fulfill()
                } else {
                    XCTFail("The amount of events returned was equal to 0.")
                }
            }
        }
        wait(for: [promise], timeout: 5.0)
    }
    
    func test_downloadImageFromGivenUrl_shouldNotReturnNil() {
        let promise = expectation(description: "The downloaded image is not nil")
        let urlString = "https://picsum.photos/200"
        sut?.downloadImage(fromURL: urlString, completionHandler: { data in
            guard let data = data else {
                XCTFail("The data returned was equal to nil")
                return
            }
            guard UIImage(data: data) != nil else {
                XCTFail("The image could not be created")
                return
            }
            promise.fulfill()

        })
        wait(for: [promise], timeout: 5.0)
    }
    
    func test_sendPostRequest_shouldReturnData() {
        let promise = expectation(description: "The post request returned an response")
        sut?.sendCheckIn(eventId: 1, userName: "Otávio", userEmail: "otavio_souza@gmail.com", completionHandler: { (data, error) in
            if error != nil {
                XCTFail("Error returned different than nil: \(error.debugDescription)")
                return
            }
            if data == nil {
                XCTFail("Data returned equal to nil")
                return
            }
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5.0)
    }
    
    override func tearDown() {
        sut = nil
    }
    
}
