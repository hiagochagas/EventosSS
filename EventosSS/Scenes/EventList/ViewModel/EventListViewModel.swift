//
//  EventListViewModel.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import Foundation
import UIKit

class EventListViewModel {
    
    private let apiRequester = APIRequester.shared
    private static let imageCache = NSCache<NSString, UIImage>()
    
    func getAllEvents(completionHandler: @escaping ([Event]) -> Void) {
        apiRequester.fetchAllEvents { (result, error) in
            var events: [Event] = []
            DispatchQueue.main.async {
                if let result = result {
                    result.forEach { eventDAO in
                        let date = Date(timeIntervalSince1970: Double(eventDAO.date)/1000.0)
                        let people = eventDAO.people.map { person in
                            return Person(name: person.name, email: person.email)
                        }
                        let event = Event(title: eventDAO.title, date: date, description: eventDAO.description, imageURL: eventDAO.imageURL, people: people, price: eventDAO.price)
                        events.append(event)
                    }
                    completionHandler(events)
                }
            }
        }
    }
    
    func fetchImage(fromURL url: String, completionHandler: @escaping (UIImage) -> ()) {
        if let imageFromCache = EventListViewModel.imageCache.object(forKey: url as NSString) {
            completionHandler(imageFromCache)
        } else {
            apiRequester.downloadImage(fromURL: url) { data in
                DispatchQueue.main.async {
                    guard let data = data else { return }
                    let imageToCache = UIImage(data: data)
                    let notFoundImage = UIImage(named: "NotFound.jpg")!
                    EventListViewModel.imageCache.setObject(imageToCache ?? notFoundImage, forKey: url as NSString)
                    completionHandler(imageToCache ?? notFoundImage)
                }
            }
        }
    }
}
