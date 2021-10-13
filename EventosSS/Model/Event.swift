//
//  Event.swift
//  EventosSS
//
//  Created by Hiago Chagas on 08/10/21.
//

import Foundation
import UIKit

struct Event {
    public var id: Int
    public var people: [Person]
    public let title: String
    public let date: Date
    public let description: String
    public let imageURL: String
    public let price: Double
    
    public init(id: Int, title: String, date: Date, description: String, imageURL: String, people: [Person], price: Double) {
        self.id = id
        self.title = title
        self.date = date
        self.description = description
        self.imageURL = imageURL
        self.people = people
        self.price = price
    }
}
