//
//  EventDetailsViewModel.swift
//  EventosSS
//
//  Created by Hiago Chagas on 12/10/21.
//

import Foundation

class EventDetailsViewModel {
    private let apiRequester = APIRequester.shared
    
    public func checkIn(forEventId id: Int, userName name: String, userEmail email: String, completion: @escaping (Bool) -> Void) {
        apiRequester.sendCheckIn(eventId: id, userName: name, userEmail: email) { (data, error) in
            if error != nil {
                completion(false)
                return
            }
            if data != nil {
                completion(true)
                return
            }
            completion(false)
        }
    }
}
