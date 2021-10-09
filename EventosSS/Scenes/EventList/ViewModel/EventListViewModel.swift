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
    private static let imageCache = NSCache<NSString, UIImage>()
    public var events: [Event] = []
    
    func getAllEvents() {
        apiRequester.fetchAllEvents { (result, error) in
            DispatchQueue.main.async {
                if let result = result {
                    result.forEach { eventDAO in
                        let date = Date(timeIntervalSince1970: Double(eventDAO.date)/1000.0)
                        let people = eventDAO.people.map { person in
                            return Person(name: person.name, email: person.email)
                        }
                        let event = Event(title: eventDAO.title, date: date, description: eventDAO.description, imageURL: eventDAO.imageURL, people: people)
                        self.events.append(event)
                    }
                    self.viewController?.reloadData()
                }
            }
        }
    }
    
    func fetchImage(fromURL url: String, toView view: UIImageView) {
        if let imageFromCache = EventListViewModel.imageCache.object(forKey: url as NSString) {
            view.image = imageFromCache
            return
        } else {
            apiRequester.downloadImage(fromURL: url) { data in
                DispatchQueue.main.async {
                    guard let data = data else { return }
                    let imageToCache = UIImage(data: data)
                    EventListViewModel.imageCache.setObject(imageToCache ?? UIImage(systemName: "xmark.seal.fill")!, forKey: url as NSString)
                    view.image = imageToCache
                }
            }
        }
    }
}
