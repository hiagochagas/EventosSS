//
//  EventListViewModel.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import Foundation
import UIKit

class EventListViewModel {
    
    private let apiRequester = APIRequester()
    public weak var viewController: EventListViewController?
    public var events: [Event] = []
    
    func getAllEvents() {
        apiRequester.fetchAllEvents { (result, error) in
            DispatchQueue.main.async {
                if let result = result {
                    result.forEach { eventDAO in
                        let date = Date(timeIntervalSince1970: Double(eventDAO.date)/1000.0)
                        let image = UIImage()
                        let people = eventDAO.people.map { person in
                            return Person(name: person.name, email: person.email)
                        }
                        let event = Event(title: eventDAO.title, date: date, description: eventDAO.description, image: image, people: people)
                        self.events.append(event)
                    }
                    self.viewController?.reloadData()
                }
            }
        }
    }
}
