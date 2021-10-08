//
//  Event.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import Foundation

struct Event: Decodable {
    let people: [Person]
    let date: Int
    let description: String
    let imageURL: String
    let longitude, latitude, price: Double
    let title, id: String
    
    enum CodingKeys: String, CodingKey {
        case people
        case date, description
        case imageURL = "image"
        case longitude, latitude, price, title, id
    }
}
