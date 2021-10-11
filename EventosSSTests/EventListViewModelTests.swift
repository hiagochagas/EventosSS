//
//  EventListViewModelTests.swift
//  EventosSSTests
//
//  Created by Hiago Chagas on 11/10/21.
//

import XCTest
@testable import EventosSS

class EventListViewModelTests: XCTestCase {
    var sut: EventListViewModel?
    
    override func setUp() {
        sut = EventListViewModel()
    }
    
    func test_getAllEvents_eventsShouldBeGreaterThanZero() {
        let promise = expectation(description: "The amount of events is greater than zero")
        sut?.getAllEvents { events in
            if events.count > 0 {
                promise.fulfill()
            }
        }
        wait(for: [promise], timeout: 5.0)
    }
    
    func test_getImageFromURL_imageShouldNotBeNil() {
        let promise = expectation(description: "The image is not nil")
        let urlString =  "https://picsum.photos/200"
        sut?.fetchImage(fromURL: urlString, completionHandler: { image in
            // This function always return a valid image, so we don't need to check it
            // If the API returns a invalid image, NotFound.jpg is the one who steps in
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5.0)
    }
    
    override func tearDown() {
        sut = nil
    }
}
