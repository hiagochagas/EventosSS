//
//  Event.swift
//  EventosSS
//
//  Created by Hiago Chagas on 08/10/21.
//

import Foundation
import UIKit

struct Event {
    public var people: [Person]
    public let title: String
    public let date: Date
    public let description: String
    public let image: UIImage?
    
    public init(title: String, date: Date, description: String, image: UIImage?, people: [Person]) {
        self.title = title
        self.date = date
        self.description = description
        self.image = image
        self.people = people
    }
}
