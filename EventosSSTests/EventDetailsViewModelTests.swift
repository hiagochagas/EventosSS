//
//  EventDetailsViewModelTests.swift
//  EventosSSTests
//
//  Created by Hiago Chagas on 12/10/21.
//

import XCTest
@testable import EventosSS

class EventDetailsViewModelTests: XCTestCase {
    private var sut: EventDetailsViewModel!
    
    override func setUp() {
        sut = EventDetailsViewModel()
    }
    
    func test_makeCheckIn_shouldReturnTrue() {
        let promise = expectation(description: "The CheckIn returned true")
        sut.checkIn(forEventId: 1, userName: "Otávio", userEmail: "otavio_souza@gmail.com") { result in
            if result {
                promise.fulfill()
            } else {
                XCTFail("The checkin could not be completed")
            }
        }
        wait(for: [promise], timeout: 5.0)
    }
    
    override func tearDown() {
        sut = nil
    }
}
