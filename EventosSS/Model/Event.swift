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
    public let imageURL: String
    
    public init(title: String, date: Date, description: String, imageURL: String, people: [Person]) {
        self.title = title
        self.date = date
        self.description = description
        self.imageURL = imageURL
        self.people = people
    }
}
