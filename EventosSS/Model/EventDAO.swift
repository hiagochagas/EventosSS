//
//  EventDAO.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import Foundation

struct EventDAO: Decodable {
    var people: [PersonDAO]
    var date: Int
    var description: String
    var imageURL: String
    var longitude, latitude, price: Double
    var title, id: String
    
    enum CodingKeys: String, CodingKey {
        case people
        case date, description
        case imageURL = "image"
        case longitude, latitude, price, title, id
    }
}
