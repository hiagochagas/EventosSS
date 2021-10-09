//
//  EventDAO.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import Foundation

struct EventDAO: Decodable {
    public var people: [PersonDAO]
    public var date: Int
    public var description: String
    public var imageURL: String
    public var longitude, latitude, price: Double
    public var title, id: String
    
    enum CodingKeys: String, CodingKey {
        case people
        case date, description
        case imageURL = "image"
        case longitude, latitude, price, title, id
    }
}
