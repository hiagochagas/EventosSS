//
//  EventListViewModel.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import Foundation

class EventListViewModel {
    
    private let apiRequester = APIRequester()
    public weak var viewController: EventListViewController?
    public var events: [Event] = []
    
    func getAllEvents() {
        apiRequester.fetchAllEvents { (results, error) in
            DispatchQueue.main.async {
                if let results = results {
                    self.events = results
                    self.viewController?.reloadData()
                }
            }
        }
    }
}
